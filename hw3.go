package main

import "fmt"


//Consider the textbook figure 8.5 and the slice example in the lower left corner, matrix(:4, 2:8:2).
//Write the corresponding Go program (hw3.go file) to create and use that slice.
//First create a 10x10 array and populate it with numbers from 1 to 100 in a row order.
//Then create the slice for that array. Print the slice.
//Modify the array by adding 100 to all the elements in the second column.
//Print the slice again. The output must be:
//[[11 12 13 14] [31 32 33 34] [51 52 53 54] [71 72 73 74]]
//[[11 112 13 14] [31 132 33 34] [51 152 53 54] [71 172 73 74]]
//Make sure to comment your code and to explain how it works. (20 points)

func main(){
    //create 10x10 matrix
    var matrix [10][10]int
    var num int = 1
    //for loop for each row
    for i := 0; i < 10; i++{
        //for loop for each column
        for j := 0; j < 10; j++ {
            matrix[i][j] = num
            //increment input num
            num += 1
        }
    }
    //create and print slice
    var slice = make([][]int, 4)
    for i := range slice {
        slice[i] = make([]int, 4)
    }
    var x = 0
    //filling slice
    for i := 1; i <= 7; i+=2{
        //make new slice
        var inner []int = matrix[i][0:4]
        slice[x] = inner
        x+=1
    }
    fmt.Println(slice)

    //add 100 to every element in second column, index 1
    for i := 0; i < 10; i++{
       matrix[i][1] += 100
    }

    //print slice again, changes to numbers are updated
    fmt.Println(slice)
}