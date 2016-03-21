//
//  main.swift
//  OptionalValues
//
//  Created by King Luo on 1/8/16.
//  Copyright © 2016 King Luo. All rights reserved.
//

import Foundation

//Optional Value1

var optionalName:String? = "John Appleseed"
//var optionalName:String?

var greeting = "Hello!"

if let name = optionalName {
    greeting = "Hello, \(name)"
    print(greeting)
}
else{
    print("optionalName is empty!")
}

//Optional value2
//let nickName: String? = nil
let nickName: String? = "King"

let fullName: String = "John Appleseed"

let informalGreeting = "Hi \(nickName ?? fullName)"

print(informalGreeting)

//Switch
let vegetable:String = "red pepper"

switch vegetable {
    
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber","watercrews":
    print("That would make a good tea sandwich")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
    
}

//for-in
let interestingNumber = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]

var largest = 0

for (kind, numbers) in interestingNumber {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}

print(largest)

//while
var n = 2
while n < 100 {
    n = n * 2
}
print("first check conditions then do: \(n)")

var m = 2
repeat {
    m = m * 2
}while m < 100
print("first do then check conditions: \(m)")

var firstForLoop = 0
for i in 0..<4 {
    firstForLoop += i
}
print("firstForLoop is \(firstForLoop)")

var secondForLoop = 0
for var i = 0; i < 4; ++i {
    secondForLoop += i
}
print("secondForLoop is \(secondForLoop)")

//Functions And Closures
func greet(name: String, day:String) -> String {
    return "Hello \(name), today is \(day)"
}
print(greet("King", day: "Saturday"))

//tuple
func caculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int){
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    for score in scores {
        if score > max {
            
            max = score
        }else if score < min {
            
            min = score
        }
        
        sum += score
    }
    
    return (min, max, sum)
}
var result = caculateStatistics([23, 4, 5, 15, 67, 8, 3])
print("The max is \(result.max), the min is \(result.min), the sum is \(result.2)")

//variable number of arguments
func sumOf(numbers: Int...) -> Int{
    var sum = 0
    for number in numbers {
        
        sum += number
    }
    
    return sum
}
print("Sum1 is \(sumOf())")
print("Sum2 is \(sumOf(10, 20, 30))")

func averageOf (numbers: Int...) -> Int {
    var average = 0
    
    for number in numbers {
        average += number
    }
    
    return average/numbers.count
}
print("Average is \(averageOf(10, 20, 30))" )

//nested function
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
print("nested function return \(returnFifteen())")

//first-type function
func makeIncrement() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    
    return addOne
}
var increment = makeIncrement()
print("first-class type is \(increment(7))")

//a function can take another function as one of its arguments
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    
    return false
}

func lessThanTen(number: Int) -> Bool {
    return number < 10
}

var numbers = [20, 19, 7, 12]
print("a function as argument \(hasAnyMatches(numbers, condition: lessThanTen))")

//Closure
var newNumbers = numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    
    return result
})
print("Closure \(newNumbers)")

//Concisely Closure
var mappedNumbers = numbers.map({number in 3 * number})
print("Concisely closure \(mappedNumbers)")

//Shortly Closure
let sortedNumber = numbers.sort { $0 > $1 }
print("Shortly closure \(sortedNumber)")