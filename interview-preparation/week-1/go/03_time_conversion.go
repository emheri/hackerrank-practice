package main

import (
	"bufio"
	"fmt"
	"io"
	"os"
	"strconv"
	"strings"
)

/*
 * Complete the 'timeConversion' function below.
 *
 * The function is expected to return a STRING.
 * The function accepts STRING s as parameter.
 */

func timeConversion(s string) string {
	timeParts := strings.Split(s, ":")
	hour, _ := strconv.Atoi(timeParts[0])
	minute := timeParts[1]
	second := timeParts[2][:2]
	amPm := timeParts[2][2:]

	if amPm == "AM" && hour == 12 {
		hour = 0
	} else if amPm == "PM" && hour < 12 {
		hour += 12
	}

	time24 := fmt.Sprintf("%02d:%s:%s", hour, minute, second)

	return time24
}

func main() {
	reader := bufio.NewReaderSize(os.Stdin, 16*1024*1024)

	stdout, err := os.Create(os.Getenv("OUTPUT_PATH"))
	checkError(err)

	defer stdout.Close()

	writer := bufio.NewWriterSize(stdout, 16*1024*1024)

	s := readLine(reader)

	result := timeConversion(s)

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
