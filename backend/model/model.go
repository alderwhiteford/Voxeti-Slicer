package model

import (
	"bufio"
	"encoding/binary"
	"encoding/json"
	"fmt"
	"io"
	"main/utilities"
	"mime/multipart"
	"os/exec"
	"path/filepath"
	"regexp"
	"strconv"
	"strings"

	"github.com/labstack/echo/v4"
)


func SliceSTLFile(binary int, file *multipart.FileHeader, logger echo.Logger) (*string, *utilities.ErrorResponse) {
	errResponse := &utilities.ErrorResponse{}

	// Retrieve the file size:
	fileSize := file.Size
	fileSizeString := fmt.Sprintf("%d", fileSize)
	
	// Open the STL file:
	stlFile, err := file.Open()
	if err != nil {
		errResponse.Code = 400
		errResponse.Message = "Failed to open STL file."
		return nil, errResponse
	}
	defer stlFile.Close()

	// Identify file type:
	var fileType string;
	if binary == 0 {
		fileType = "-t"
	} else if binary == 1 {
		fileType = "-b"
	} else {
		errResponse.Code = 400
		errResponse.Message = "Invalid file type code!"
		return nil, errResponse
	}

	// Create a command for the C++ project.
	cmd := exec.Command(
		"../CuraEngine/build/Release/CuraEngine",
		"slice",
		fileType,
		fileSizeString,
	)

	cmd.Stdin = stlFile

	output, err := cmd.CombinedOutput()
	if err != nil {
		errResponse.Code = 400
		errResponse.Message = fmt.Sprintf("Error: %s", err.Error()) // "Unable to slice STL file!"
		return nil, errResponse
	}
	stringOutput := string(output)

	// Return the output (including any error messages)
	return &stringOutput, nil
}

func ValidateSTLFile(file *multipart.FileHeader) (*int, *utilities.ErrorResponse) {
	errResponse := &utilities.ErrorResponse{}
	
	// Enforce Size Limitations:
	if file.Size > utilities.FILE_MAX_SIZE {
		errResponse.Code = 400
		errResponse.Message = "STL file exceeds the 20MB file limit"
		return nil, errResponse
	}

	// Open the STL File:
	src, err := file.Open()
	if err != nil {
		errResponse.Code = 500
		errResponse.Message = "Failed to open the STL File!"
		return nil, errResponse
	}
	defer src.Close()

	// Check the file extension:
	fileExtension := filepath.Ext(file.Filename)
	if fileExtension != ".stl" {
		errResponse.Code = 400
		errResponse.Message = "File type is not STL!"
		return nil, errResponse
	}

	// Parse the first 5 bytes to check if the file is ASCII or binary:
	firstBytes := make([]byte, 5)
	_, err = src.Read(firstBytes)
	if err != nil {
		errResponse.Code = 500
		errResponse.Message = "Failed to read STL file!"
		return nil, errResponse
	}

	var fileType int;
	// Determine which method to call:
	if string(firstBytes) == "solid" {
		// Validate an ASCII file:
		if err := ValidateASCIISTLFile(src, file.Size); err != nil {
			return nil, err
		}
		fileType = 0
	} else {
		// Validate a binary file:
		if err := ValidateBinarySTLFile(src, file.Size); err != nil {
			return nil, err
		}
		fileType = 1
	}
	// Return success:
	return &fileType, nil
}

func ValidateBinarySTLFile(file multipart.File, size int64) *utilities.ErrorResponse {
	errResponse := &utilities.ErrorResponse{}

	// Check file size:
	if size < 84 {
		errResponse.Code = 400
		errResponse.Message = "Binary file is too small!"
		return errResponse
	}

	// Set current read to the 80th byte:
	_, err := file.Seek(80, io.SeekStart)
	if err != nil {
		errResponse.Code = 400
		errResponse.Message = "Unable to read bytes after binary file header!"
		return errResponse
	}

	// Read the number of triangles in bits:
	triangleBytes := make([]byte, 4)
	_, err = file.Read(triangleBytes)
	if err != nil {
		errResponse.Code = 500
		errResponse.Message = "Failed to read triangle bytes from binary STL file!"
		return errResponse
	}

	// Convert bits to little-endian unsigned int32:
	numberOfTriangles := binary.LittleEndian.Uint32(triangleBytes)
	computedFileSize := 84 + (numberOfTriangles * 50)

	// Confirm file size matches number of triangles + header:
	if size != int64(computedFileSize) {
		errResponse.Code = 400
		errResponse.Message = "Invalid binary file!"
		return errResponse
	}

	return nil
}

func ValidateASCIISTLFile(file multipart.File, size int64) *utilities.ErrorResponse {
	errResponse := &utilities.ErrorResponse{}

	// Check file size:
	if size < 15 {
		errResponse.Code = 400
		errResponse.Message = "ASCII file is too small!"
		return errResponse
	}

	scanner := bufio.NewScanner(file)
	lineNumber := 1
	seenEndSolid := false
	for scanner.Scan() {
		// Check to make sure the end of the file is the true end:
		if seenEndSolid {
			errResponse.Code = 400
			errResponse.Message = "Invalid STL ASCII File, extra line after endsolid!"
			return errResponse
		}
		// Line 2 must begin with "facet" or "endsolid"
		if lineNumber == 2 {
			if strings.HasPrefix(strings.Trim(scanner.Text(), " "), "endsolid") {
				seenEndSolid = true
				continue
			} else if !strings.HasPrefix(strings.Trim(scanner.Text(), " "), "facet") {
				errResponse.Code = 400
				errResponse.Message = "Invalid STL ASCII File, line 2 missing facet!"
				return errResponse
			}
		}
		// Locate end of file:
		if strings.HasPrefix(strings.Trim(scanner.Text(), " "), "endsolid") {
			seenEndSolid = true
			continue
		}
		lineNumber += 1
	}

	// Check if the end of the file was found:
	if !seenEndSolid {
		errResponse.Code = 400
		errResponse.Message = "Invalid STL ASCII File, end of file not found!"
		return errResponse
	} else {
		return nil
	}
}

func ParseSliceOutput(output string) (*utilities.SliceData, *utilities.ErrorResponse) {
	errResponse := &utilities.ErrorResponse{}

	var rex = regexp.MustCompile(";([^:]+):([^;]+)")

	data := rex.FindAllStringSubmatch(output, -1)

	res := make(map[string]interface{})
	// For each key value pair:
	for _, kv := range data {
		k := strings.ToLower(regexp.MustCompile(`[^a-zA-Z]+`).ReplaceAllString(kv[1], ""))
		v := strings.Replace(kv[2], "\n", "", -1)
		if k != "targetmachinename" && k != "flavor" {
			v = strings.ReplaceAll(v, " ", "")
			v = strings.ReplaceAll(v, "m", "")
			i, err := strconv.ParseFloat(v, 32)
			if err != nil {
				errResponse.Code = 400
				errResponse.Message = "Failed to slice STL!"
				return nil, errResponse
			}
			res[k] = i
		} else {
			res[k] = v
		}
	}

	// Marshal to JSON:
	jsonData, jsonErr := json.Marshal(res)
	if jsonErr != nil {
		errResponse.Code = 500
		errResponse.Message = "Failed to marshal struct to JSON!"
		return nil, errResponse
	}

	// Unmarshal into Slice Data Struct:
	var structData utilities.SliceData
	unmarshalErr := json.Unmarshal(jsonData, &structData)
	if unmarshalErr != nil {
		errResponse.Code = 500
		errResponse.Message = "Failed to unmarshal struct to slice data!"
		return nil, errResponse
	}

	return &structData, nil
}