//
//  main.swift
//  SwfitDemo2.3-StringAndCharacter
//
//  Created by King Luo on 11/13/14.
//  Copyright (c) 2014 King Luo. All rights reserved.
//

import Foundation

let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"//"Imagination is more important than knowledge" - Einstein
let dollarSign = "\u{24}"// $,  Unicode scalar U+0024
let blackHeart = "\u{2665}"      // ♥,  Unicode scalar U+2665
let sparklingHeart = "\u{1F496}" // 💖, Unicode scalar U+1F496


var emptyString = ""
var anotherEmptyString = String()//两者等价

if emptyString.isEmpty {
    println("Nothing to see here")
}

var variableString = "Horse"
variableString += " and carriage" // variableString 现为 Horse and carriage
let constantString = "Highlander"
//constantString += " and another Highlander" //编译错误

for character in "Dog!????" {
    println(character)
}

let yenSign: Character = "￥"

let unusualMenagerite = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
println("unusualMenagerite has \(countElements(unusualMenagerite))")//输出40

var string1 = "hello"
let string2 = " there"
let character1: Character = "1"
let character2: Character = "2"
var stringPlusCharacter = string1.append(character1)

var word = "cafe"
println("the number of characters in \(word) is \(countElements(word))")
// 输出 "the number of characters in cafe is 4"

word += "\u{301}"    // 附加音调的字符, U+0301

println("the number of characters in \(word) is \(countElements(word))")
// 输出 "the number of characters in café is 4"

let quotation = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotation == sameQuotation {
    println("These two strings are considered equal")
}
// 输出"These two strings are considered equal"

// "Voulez-vous un café?" using LATIN SMALL LETTER E WITH ACUTE
let eAcuteQuestion = "Voulez-vous un caf\u{E9}?"

// "Voulez-vous un café?" using LATIN SMALL LETTER E and COMBINING ACUTE ACCENT
let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"

if eAcuteQuestion == combinedEAcuteQuestion {
    println("These two strings are considered equal")
}// 输出 "These two strings are considered equal"

let latinCapitalLetterA: Character = "\u{41}"

let cyrillicCapitalLetterA: Character = "\u{0410}"

if latinCapitalLetterA != cyrillicCapitalLetterA {
    println("These two characters are not equivalent")
}// 输出 "These two characters are not equivalent"

let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1 ") {
        ++act1SceneCount
    }
}
println("There are \(act1SceneCount) scenes in Act 1")// 输出 "There are 5 scenes in Act 1"

var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        ++mansionCount
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        ++cellCount
    }
}
println("\(mansionCount) mansion scenes; \(cellCount) cell scenes")// 输出 "6 mansion scenes; 2 cell scenes"

let dogString = "Dog‼🐶"

for codeUnit in dogString.utf8 {
    print("\(codeUnit) ")
}
print("\n")// 68 111 103 226 128 188 240 159 144 182

for codeUnit in dogString.utf16 {
    print("\(codeUnit) ")
}
print("\n")
// 68 111 103 8252 55357 56374

for scalar in dogString.unicodeScalars {
    print("\(scalar.value) ")
} // 68 111 103 8252 128054

for scalar in dogString.unicodeScalars {
    print("\(scalar) ")
} // D o g ‼ 🐶