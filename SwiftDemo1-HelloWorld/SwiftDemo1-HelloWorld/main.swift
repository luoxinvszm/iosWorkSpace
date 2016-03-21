//
//  main.swift
//  SwiftDemo1-HelloWorld
//
//  Created by King Luo on 10/31/14.
//  Copyright (c) 2014 King Luo. All rights reserved.
//

import Foundation

println("Hello, World!")

var myVariable = 42
myVariable = 50
let myConstant = 42

println(myVariable)

println(myConstant)

let implicitInteger = 70
let implicitDouble = 70.01
let explicitDouble: Double = 70

let explicitFloat: Float = 4

println(explicitFloat)

println(explicitDouble)

println(implicitDouble)


let label = "The width is "
let width = 94
let widthLabel = label + String(width)
println(widthLabel)

let apples = 3
let oranges = 5
let applesSummary = "I hava \(apples) apples"
let orangeSummary = "I hava \(oranges) oranges"
println(applesSummary)
println(orangeSummary)

let numA:Double = 5.25
let numB:Double = 0.4
var result:Double = numA * numB
let say = "Hi~ king. \(numA) * \(numB) = \(result)"
println(say)

var shoppingList = ["catfish", "water", "tulips", "blue paint"]
shoppingList[1] = "bottle of water"
var occupations = [
    "Malcolm" : "Captain",
    "Keylee" : "Mechanic",
]
occupations["Jayne"] = "Public Relation"
println(shoppingList)
println(occupations)

let emptyArray = [String]()
let emptyDictionary = Dictionary<String, Float>()

var shoppingList2 = []
var occupations2 = [:]

let individualScore = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScore {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
println(teamScore)


var optionalString: String? = "Hello"
println(optionalString == nil)

//var optionalName: String? = "King Luo"
var optionalName: String? = nil
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
} else {
    greeting = "Haha"
}
println(greeting)

let vegetable = "red pepper"
switch vegetable {
case "celery":
    let vegetableComment = "Add some raisins and make ants on a log."
    println(vegetableComment)
case "cucumber", "watercress":
    let vegetableComment = "That would make a good tea sandwich."
    println(vegetableComment)
case let x where x.hasSuffix("pepper"):
    let vegetableComment = "Is it a spicy \(x)?"
    println(vegetableComment)
default:
    let vegetableComment = "Everything tastes good in soup."
    println(vegetableComment)
}

let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25]
]
var largest = 0
var type = ""
for (kinds, numbers) in (interestingNumbers) {
    for number in numbers {
        if number > largest {
            largest = number
            type = kinds
        }
    }
}
println(type + " :  \(largest)")

var n = 2
while n < 100 {
    n = n * 2
}
println(n)

var m = 2
do {
    m = m * 2
} while m < 100
println(m)

var firstForLoop = 0
for i in 0...3 {
    firstForLoop += i
}
println(firstForLoop)

var secondForLoop = 0
for var i = 0; i < 3; i++ {
    secondForLoop += i
}
println(secondForLoop)

func greet(name: String, day: String) -> String {
    return "Hello \(name), today is \(day)."
}

println(greet("King", "Tuesday"))

func getGasPrices() -> (Double, Double, Double) {
    return (3.59, 3.69, 3.79)
}
println(getGasPrices())

func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}

println(sumOf())
println(sumOf(42, 597, 12))


func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
println(returnFifteen())

func makeIncrementer() -> (Int -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
println(increment(7))

func hasAnyMatches(list: [Int], condition: Int -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool{
    return number < 10
}
var numbers = [20, 19, 7, 12]
println(hasAnyMatches(numbers, lessThanTen))

numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})


class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A Shape with \(numberOfSides) sides."
    }
}

var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()


class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A Shape with \(numberOfSides) sides."
    }
}


class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}
let test = Square(sideLength: 5.2, name: "My test square")
println(test.area())
println(test.simpleDescription())

class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triagle with sides of length \(sideLength)."
    }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
triangle.perimeter = 9.9
triangle.sideLength = 3
println(triangle.perimeter)
println(triangle.simpleDescription())

class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    
    init(size: Double, name: String){
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
 var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")

println(triangleAndSquare.square.sideLength)
println(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
println(triangleAndSquare.triangle.sideLength)

class Counter {
    var count: Int = 0
    func incrementBy(amount: Int, numberOfTimes times: Int) {
        count += amount * times
    }
}
var counter = Counter()
counter.incrementBy(2, numberOfTimes: 7)

let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength
println(sideLength)

enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.Ace
let aceRawValue = ace.rawValue
println(ace)
println(aceRawValue)

enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
}
let hearts = Suit.Hearts
let heartsDescription = hearts.simpleDescription()

struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .Three, suit: .Spades)
println(threeOfSpades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()
println(threeOfSpadesDescription)

enum ServerResponse {
    case Result(String, String)
    case Error(String)
}

let success = ServerResponse.Result("6:00 am", "8:09 pm")
let faulure = ServerResponse.Error("Out of cheese")

switch success {
case let .Result(sunrise, sunset):
    let serverResponse = "Sunrise is at \(sunrise) and sunset is at \(sunset)."
case let .Error(error):
    let serverResponse = "Failure... \(error)"
}

protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProtocol: Int = 69105
    func adjust() {
        simpleDescription += " Now 100% adjusted."
    }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure."
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription

enum SimpleEnum: ExampleProtocol {
    case Earth, Moon, Mars
    var simpleDescription: String {
        get {
            switch self {
            case .Earth:
                return "earth"
            case .Moon:
                return "moon"
            case .Mars:
                return "mars"
            }
        }
    }
    
    mutating func adjust() {
        switch self {
        case .Earth:
            self = .Moon
        case .Moon:
            self = .Mars
        case .Mars:
            self = .Earth
        }
    }
}
var myEnum = SimpleEnum.Earth
println(myEnum.simpleDescription)
myEnum.adjust()
println(myEnum.simpleDescription)
myEnum.adjust()
println(myEnum.simpleDescription)
myEnum.adjust()

var exProtocol: ExampleProtocol = SimpleEnum.Earth
println("protocol:\(exProtocol.simpleDescription)")
exProtocol.adjust()
println("protocol:\(exProtocol.simpleDescription)")
exProtocol.adjust()
println("protocol:\(exProtocol.simpleDescription)")
exProtocol.adjust()
println("protocol:\(exProtocol.simpleDescription)")
exProtocol.adjust()

extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    
    mutating func adjust() {
        self += 42
    }
}
println(7.simpleDescription)

let protocolValue: ExampleProtocol = a
protocolValue.simpleDescription
//protocolValue.anotherProtocol//Uncomment to see the error

func repeat<ItemType>(item: ItemType, times: Int) -> [ItemType] {
    var result = [ItemType]()
    for i in 0...times {
//        result += item
    }
    return result
    
}
repeat("knock", 4)

enum OptionalValue<T> {
    case None
    case Some(T)
}
var possibleInteger: OptionalValue<Int>= .None
possibleInteger = .Some(100)

func anyCommonElements<T, U where T: Sequence, U: Sequence, T.GeneratorType.Element: Equatable, T.GeneratorType.Element == U.GeneratorType.Element> (lhs: T, ths: U) -> Bool {
    for ihsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}
anyCommonElements([1, 2, 3], [3])