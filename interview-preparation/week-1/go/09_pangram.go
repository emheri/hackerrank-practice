package main

import (
	"bufio"
	"fmt"
	"io"
	"os"
	"strings"
)

/*
 * Complete the 'pangrams' function below.
 *
 * The function is expected to return a STRING.
 * The function accepts STRING s as parameter.
 */

func pangrams(s string) string {
	// Convert the string to lowercase for case-insensitive comparison
	s = strings.ToLower(s)

	// Create a map to keep track of the presence of each letter
	letterMap := make(map[rune]bool)

	// Iterate over each character in the string
	for _, ch := range s {
		// Check if the character is a letter
		if ch >= 'a' && ch <= 'z' {
			// Mark the letter as present in the map
			letterMap[ch] = true
		}
	}

	// Check if all letters from 'a' to 'z' are present
	for ch := 'a'; ch <= 'z'; ch++ {
		if !letterMap[ch] {
			return "not pangram"
		}
	}

	return "pangram"
}

func main() {
	reader := bufio.NewReaderSize(os.Stdin, 16*1024*1024)

	stdout, err := os.Create(os.Getenv("OUTPUT_PATH"))
	checkError(err)

	defer stdout.Close()

	writer := bufio.NewWriterSize(stdout, 16*1024*1024)

	s := readLine(reader)

	result := pangrams(s)

	fmt.Fprintf(writer, "%s\n", result)

	writer.Flush()
}

func readLine(reader *bufio.Reader) string {
	str, _, err := reader.ReadLine()
	if err == io.EOF {
		return ""
	}

	return strings.TrimRight(string(str), "\r\n")
}

func checkError(err error) {
	if err != nil {
		panic(err)
	}
}
