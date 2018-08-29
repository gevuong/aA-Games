package main

import "fmt"

func singleNumber(nums []int) int {
	if len(nums) == 1 {
		return nums[0]
	}
	var count = map[int]int{}

	for _, int := range nums {
		count[int]++
	}

	for k, v := range count {
		if v == 1 {
			return k
		}
	}
	return -1
}

// Time: O(n), iterates through nums slice once
// Space: O(1)
func singleNumber2(nums []int) int {
	a := nums[0]
	for num := range nums {
		a ^= num
	}
	return a
}

func main() {
	a := []int{2, 2, 1}
	b := singleNumber(a)
	c := singleNumber2(a)
	fmt.Println(b, c)
}
