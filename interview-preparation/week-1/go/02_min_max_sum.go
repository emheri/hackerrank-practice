package main

import (
	"bufio"
	"fmt"
	"io"
	"os"
	"sort"
	"strconv"
	"strings"
)

/*
 * Complete the 'miniMaxSum' function below.
 *
 * The function accepts INTEGER_ARRAY arr as parameter.
 */

func miniMaxSum(arr []int32) {
	min, max := int64(0), int64(0)
	minIndex := 0
	maxIndex := len(arr) - 1

	// Convert []int32 to []int64 for sorting
	sortedArr := make([]int64, len(arr))
	for i, num := range arr {
		sortedArr[i] = int64(num)
	}

	// Sort the array in ascending order
	sort.Slice(sortedArr, func(i, j int) bool {
		return sortedArr[i] < sortedArr[j]
	})

	// Calculate the minimum and maximum sums
	for i := 1; i <= 4; i++ {
		min += sortedArr[minIndex]
		max += sortedArr[maxIndex]
		minIndex++
		maxIndex--
	}

	fmt.Println(min, max)
}

func main() {
	reader := bufio.NewReaderSize(os.Stdin, 16*1024*1024)

	arrTemp := strings.Split(strings.TrimSpace(readLine(reader)), " ")

	var arr []int32

	for i := 0; i < 5; i++ {
		arrItemTemp, err := strconv.ParseInt(arrTemp[i], 10, 64)
		checkError(err)
		arrItem := int32(arrItemTemp)
		arr = append(arr, arrItem)
	}

	miniMaxSum(arr)
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
