package model

import (
	"encoding/json"
	"fmt"
	"main/utilities"
	"mime/multipart"
	"os"
	"os/exec"
	"regexp"
	"strconv"
	"strings"
)

func SliceSTLFileV2(binary string, file *multipart.FileHeader) (*string, *utilities.ErrorResponse) {
	errResponse := &utilities.ErrorResponse{}

	stlFile, err := os.Open("./assets/test.stl")
	if err != nil {
		panic(err)
	}
  defer stlFile.Close()

	// Retrieve the file size:
	fileInfo, err := stlFile.Stat()
	if err != nil {
		panic(err)
	}

	fileSize := fmt.Sprintf("%d", fileInfo.Size())

	// Create a command for the C++ project.
	cmd := exec.Command(
		"../CuraEngine/build/Release/CuraEngine",
		"slice",
		"-b",
		fileSize,
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


func SliceSTLFile(binary string, file *multipart.FileHeader) (*string, *utilities.ErrorResponse) {
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
	var fileType string = "-b"
	if binary == "false" {
		fileType = "-t"
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

func ValidateSTLFile(file *multipart.FileHeader) *utilities.ErrorResponse {
	errResponse := &utilities.ErrorResponse{}

	// Do not allow file size to exceed 20mb:
	if file.Size > (1000 * 1000 * 20) {
		errResponse.Code = 400
		errResponse.Message = "STL file exceeds the 20MB file limit"
		return errResponse
	}

	// Check the file extension:
	strArr := strings.Split(file.Filename, ".")
	if len(strArr) < 2 || (strArr[1] != "stl" && strArr[1] != "STL") {
		errResponse.Code = 400
		errResponse.Message = "Please provide an STL file!"
		return errResponse
	}

	return nil
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