import Foundation
import Darwin
import UIKit

//Set up our empty arrays and dictionary
var NumArray: [Int] = []
var sortedArr: [Int] = []
var sortedDict: [Int:Int] = [:]

//Function to give us a random number from 0-100 we havent used yet
func uniqueNum()->Int{
    var leave = true
    var num:Int = Int(arc4random_uniform(100))
    while(true){
        leave = true
        for val in NumArray{
            if(val == num){
                leave = false
			}
		}
        if(leave == true){
            break
		}
        num = Int(arc4random_uniform(100))
	}
    return num
}

//Function to return a sorted version of the array
func sortArray()->[Int]{
    let newArray: [Int] = NumArray.sorted()
    return newArray
}

//Function to assign a dictionary to the array using 0-9
func sortDict()->[Int:Int]{
    var newDict: [Int:Int] = [:]
    for val in 0...9{
        newDict[val] = sortedArr[val]
	}
    return newDict
}

//Assign 5 variables and 5 constants random values using "UniqueNum"
var var1:Int = Int(arc4random_uniform(100))
NumArray.append(var1)
var var2:Int = uniqueNum()
NumArray.append(var2)
var var3:Int = uniqueNum()
NumArray.append(var3)
var var4:Int = uniqueNum()
NumArray.append(var4)
var var5:Int = uniqueNum()
NumArray.append(var5)
let const1:Int = uniqueNum()
NumArray.append(const1)
let const2:Int = uniqueNum()
NumArray.append(const2)
let const3:Int = uniqueNum()
NumArray.append(const3)
let const4:Int = uniqueNum()
NumArray.append(const4)
let const5:Int = uniqueNum()
NumArray.append(const5)

//First Test
print("The initial array is \(NumArray)")
sortedArr = sortArray()
print("The sorted array is \(sortedArr)")
sortedDict = sortDict()
print("The Dictionary is \(sortedDict)")

//Change a number and reshow outputs
var3 = uniqueNum()
print("Var3 was changed to \(var3)")
NumArray[2] = var3
print("The new array is \(NumArray)")
sortedArr = sortArray()
print("The new sorted array is \(sortedArr)")
sortedDict = sortDict()
print("The new Dictionary is \(sortedDict)")


