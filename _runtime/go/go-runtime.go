// main.go

package main

import (
	"fmt"
	"os"
	"runtime"
)

func main() {
	fmt.Println("Go Runtime Environment")
	fmt.Printf("Go version: %s\n", runtime.Version())
	fmt.Printf("Current working directory: %s\n", getCurrentDir())
	fmt.Printf("Operating system: %s\n", runtime.GOOS)
	fmt.Printf("Architecture: %s\n", runtime.GOARCH)

	// Add your application logic here
	// For example:
	// app.Start()
}

func getCurrentDir() string {
	dir, err := os.Getwd()
	if err != nil {
		return "Unknown"
	}
	return dir
}
