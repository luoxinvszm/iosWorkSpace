//
//  main.swift
//  SwiftDemo2.2-Operator
//
//  Created by King Luo on 11/13/14.
//  Copyright (c) 2014 King Luo. All rights reserved.
//

import Foundation

//let b = 10
//var a = 5
//a = b //a 现在等于 10

let (x, y) = (1, 2) //现在 x 等于 1， y 等于 2

//if x = y {
//    //Cannot assign to 'let' value 'x'
//}

1 + 2
5 - 3
2 * 3
10.0 / 2.5

"hello, " + "world"

let dog: Character = "d"
let cow: Character = "c"
//let dogcow = dog + cow //dogcow 现在时 “dc”‘

9 % 4 //等于 1

8 % 2.5 //等于 0.5

var i = 0
++i //现在 i = 1

var a = 0
let b = ++a // a 和 b 都是1
let c = a++ // a 是 2，c 是 a 自增前的值 1

let three = 3
let minusThree = -three //minusThree 等于 -3
let plusThree = -minusThree //plusThree 等于 3

let minusSix = -6
let alsoMinusSix = +minusSix // alsoMinusSix 等于 -6

var n = 1
n += 2 // n 现在时 3

let name = "world"
if name == "world" {
    println("hello, world")
} else {
    println("对不起， \(name), 我不认识你")
} //输出"hello, world"

let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20) //rowHeight 现在是 90


for index in 1...5 {
    println("\(index) * 5 = \(index * 5)")
}
//输出1 * 5 = 5
//2 * 5 = 10
//3 * 5 = 15
//4 * 5 = 20
//5 * 5 = 25

let allowedEntry = false
if !allowedEntry {
    println("ACCESS DENIED")
}

let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
    println("Welcome")
} else {
    println("ACCESS DENIED")
} //输出 ACCESS DENIED

let hasDoorKey = false
let knowsOverridePassword = true
if hasDoorKey || knowsOverridePassword {
    println("Welcome")
} else {
    println("ACCESS DENIED")
}//输出 Welcome

if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
    println("Welcome")
} else {
    println("ACCESS DENIED")
}//输出 Welcome

 