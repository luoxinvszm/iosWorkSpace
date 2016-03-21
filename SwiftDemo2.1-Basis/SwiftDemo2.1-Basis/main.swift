//
//  main.swift
//  SwiftDemo2.1-Basis
//
//  Created by King Luo on 11/12/14.
//  Copyright (c) 2014 King Luo. All rights reserved.
//

import Foundation

println("Hello, World!")

let maximumNumberOfLoginAttempts = 10
var currentLoginAttemp = 0

var x = 0.0, y = 0.0, z = 0.0

var welcomeMessage: String //声明一个类型为String，名字为welcomeMessage的变量

var π = 3.14159
let 你好 = "hello world"
let ？？？ = "dogcow"

println(你好) //输出hello world

println("This is a string.") //输出This is a string.

println("I try to use swfit,\(你好)")//输出I try to use swfit,hello world

//这是一个注释

/*
这是一个多行注释
*/

let minValue = UInt8.min //minValue为0，是UInt8类型的最小值
let maxValue = UInt8.max //maxValue为255，是UInt8类型的最大值

let meaningOfLife = 42 //meaningOfLife会被推测为Int类型
//let pi = 3.14159 //pi会被推测为Double类型

let decimalInteger = 17
let binaryInteger = 0b10001 //二进制的17
let octalInteger = 0o21 //八进制的17
let hexadecimalInteger = 0x11 //十六进制的17

//下面的这些浮点字面量都等于十进制的12.1875
let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0

let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1

let twoThousand: UInt16 = 2_000
let one:UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)

let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi = Double(three) + pointOneFourOneFiveNine //pi等于3.14159，被推断为Double
let integerPi = Int(pi) //integerPi等于3，被推断为Int

typealias AudioSample = UInt16 //假设用于处理特定长度的外度资源
var minAmplitudeFound = AudioSample.min //maxAmplitudeFound现在时0

let orangeAreOrange = true
let turnipsAreDelicious = false

if turnipsAreDelicious {
    println("Mmm, tasty turnips")
} else {
    println("Eww, turnips ars horrible.")
}//输出“Eww, turnips ars horrible.”

let http404Error = (404, "Not Found") //http404Error的类型是（Int, String），值是(404, "Not Found")

let (statusCode, statesMessage) = http404Error
println("The status code is \(statusCode)") //输出“The status code is 404”
println("The status message is \(statesMessage)") //输出“The status message is Not Found”

println("The status code is \(http404Error.0)") //输出“The status code is 404”
println("The status message is \(http404Error.1)") //输出“The status message is Not Found”

let http200Status = (statusCode: 200, description: "OK")
println("The status code is \(http200Status.statusCode)") //输出“The status code is 200”
println("The status message is \(http200Status.description)") //输出“The status message is OK”

let possibleNumber = "123"
let convertedNumber = possibleNumber.toInt() // convertedNumber被推测为类型“Int?”，或者类型"optional Int"

if convertedNumber != nil {
    println("\(possibleNumber) has an integer value of \(convertedNumber!).")
} else {
    println("\(possibleNumber) could not be converted to an integer.")
} //输出“123 has an integer value of 123.”

if let actualNumber = possibleNumber.toInt() {
    println("\(possibleNumber) has an integer value of \(convertedNumber!).")
} else {
    println("\(possibleNumber) could not be converted to an integer.")
} //输出“123 has an integer value of 123.”

var serverResponseCode: Int? = 404 //serverResponseCode包含一个可选的Int值404
serverResponseCode = nil // serverResponseCode现在不包含值

var surveyAnswer: String? //surveyAnswer被自动设置为nil

let possibleString: String? = "An optional string."
println(possibleString!) //需要感叹号来获取值，输出“An optional string.”

let assumedString: String! = "An impilicty unwrapped optional string."
println(assumedString) //不需要感叹号，输出“An impilicty unwrapped optional string.”

if assumedString != nil {
    println(assumedString)
}//输出“An impilicty unwrapped optional string.”

if let definiteString = assumedString {
    println(definiteString)
}//输出“An impilicty unwrapped optional string.”

let age = -3
assert(age >= 0, "A person's age cannot be less than zero")//age < 0.触发断言

assert(age >= 0)



