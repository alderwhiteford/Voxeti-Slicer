package main

import (
	"encoding/json"
	"fmt"
	"os"
	"os/exec"
	"regexp"
	"strconv"
	"strings"
)

func main() {
	file, err := os.Open("./assets/test.stl")
	if err != nil {
		panic(err)
	}
	defer file.Close()

	// Create a command for the C++ project.
	cmd := exec.Command(
		"../CuraEngine/build/Release/CuraEngine",
		"slice",
		"-b",
	)

	cmd.Stdin = file

	output, err := cmd.CombinedOutput()
	if err != nil {
		panic(err)
	}

	// Print the output (including any error messages)
	fmt.Println("C++ module output:")

	parseOutput(string(output))

	//fmt.Println(data)
}

type SliceData struct {
	Flavor            string  `json:"flavor"`
	TimeS             int     `json:"time"`
	FilamentUsed      float32 `json:"filamentused"`
	LayerHeight       float32 `json:"layerheight"`
	MinX              float32 `json:"minx"`
	MinY              float32 `json:"miny"`
	MinZ              float32 `json:"minz"`
	MaxX              float32 `json:"maxx"`
	MaxY              float32 `json:"maxy"`
	MaxZ              float32 `json:"maxz"`
	TargetMachineName string  `json:"targetmachinename"`
}

func parseOutput(output string) SliceData {
	var rex = regexp.MustCompile(";([^:]+):([^;]+)")

	data := rex.FindAllStringSubmatch(output, -1)

	res := make(map[string]interface{})
	for _, kv := range data {
		k := strings.ToLower(regexp.MustCompile(`[^a-zA-Z]+`).ReplaceAllString(kv[1], ""))
		v := strings.Replace(kv[2], "\n", "", -1)
		if k != "targetmachinename" && k != "flavor" {
			v = strings.ReplaceAll(v, " ", "")
			v = strings.ReplaceAll(v, "m", "")
			i, err := strconv.ParseFloat(v, 32)
			if err != nil {
				// ... handle error
				panic(err)
			}
			res[k] = i
		} else {
			res[k] = v
		}
	}
	fmt.Println(res)

	jsonData, jsonErr := json.Marshal(res)
	if jsonErr != nil {
		// ... handle error
		panic(jsonErr)
	}

	// Convert the JSON to a struct
	var structData SliceData
	unmarshalErr := json.Unmarshal(jsonData, &structData)
	if unmarshalErr != nil {
		// ... handle error
		panic(unmarshalErr)
	}

	fmt.Println(structData)

	return structData
}
