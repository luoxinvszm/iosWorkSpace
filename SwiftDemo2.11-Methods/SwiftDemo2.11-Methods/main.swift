//
//  main.swift
//  SwiftDemo2.11-Methods
//
//  Created by King Luo on 11/18/14.
//  Copyright (c) 2014 King Luo. All rights reserved.
//

import Foundation

//class Counter {
//    var count = 0
//    func increment() {
//        count++
//    }
//    func incrementBy(amount: Int) {
//        count += amount
//    }
//    func reset() {
//        count = 0
//    }
//}
//
//let counter = Counter()
//// the initial counter value is 0
//counter.increment()
//// the counter's value is now 1
//counter.incrementBy(5)
//// the counter's value is now 6
//counter.reset()
//// the counter's value is now 0

class Counter {
    var count: Int = 0
//    func incrementBy(amount: Int, numberOfTimes: Int) {
//        count += amount * numberOfTimes
//    }
    func incrementBy(amount: Int, #numberOfTimes: Int) {
        count += amount * numberOfTimes
    }
}

let counter = Counter()
counter.incrementBy(5, numberOfTimes: 3)
// counter value is now 15


//struct Point {
//    var x = 0.0, y = 0.0
//    func isToTheRightOfX(x: Double) -> Bool {
//        return self.x > x
//    }
//}
//let somePoint = Point(x: 4.0, y: 5.0)
//if somePoint.isToTheRightOfX(1.0) {
//    println("This point is to the right of the line where x == 1.0")
//}
//// prints "This point is to the right of the line where x == 1.0

//struct Point {
//    var x = 0.0, y = 0.0
//    mutating func moveByX(deltaX: Double, y deltaY: Double) {
//        x += deltaX
//        y += deltaY
//    }
//}
//var somePoint = Point(x: 1.0, y: 1.0)
//somePoint.moveByX(2.0, y: 3.0)
//println("The point is now at (\(somePoint.x), \(somePoint.y))")
// prints "The point is now at (3.0, 4.0)"

//let fixedPoint = Point(x: 3.0, y: 3.0)
//fixedPoint.moveByX(2.0, y: 3.0)
//// this will report an error

struct Point {
    var x = 0.0, y = 0.0
    mutating func moveByX(deltaX: Double, y deltaY: Double) {
        self = Point(x: x + deltaX, y: y + deltaY)
    }
}

enum TriStateSwitch {
    case Off, Low, High
    mutating func next() {
        switch self {
        case Off:
            self = Low
        case Low:
            self = High
        case High:
            self = Off
        }
    }
}
var ovenLight = TriStateSwitch.Low
ovenLight.next()
// ovenLight is now equal to .High
ovenLight.next()
// ovenLight is now equal to .Off

class SomeClass {
    class func someTypeMethod() {
        // type method implementation goes here
    }
}
SomeClass.someTypeMethod()

struct LevelTracker {
    static var highestUnlockedLevel = 1
    static func unlockLevel(level: Int) {
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
        }
    }
    static func levelIsUnlocked(level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    var currentLevel = 1
    mutating func advanceToLevel(level: Int) -> Bool {
        if LevelTracker.levelIsUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName: String
    func completedLevel(level: Int) {
        LevelTracker.unlockLevel(level + 1)
        tracker.advanceToLevel(level + 1)
    }
    init(name: String) {
        playerName = name
    }
}

var player = Player(name: "Argyrios")
player.completedLevel(1)
println("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")
// prints "highest unlocked level is now 2"
