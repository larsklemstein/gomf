package main

// module github.com/larsklemstein/gomf

import (
	"fmt"
	"os"
)

func main() {
	fmt.Println(GetMessage())

	os.Exit(0)
}

func GetMessage() string {
	return "Hello..."
}
