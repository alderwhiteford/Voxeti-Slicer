package main

import (
	"fmt"
	"os"
	"os/exec"
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
	fmt.Println(string(output))
}