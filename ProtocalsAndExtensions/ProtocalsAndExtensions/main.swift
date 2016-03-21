//
//  main.swift
//  ProtocalsAndExtensions
//
//  Created by King Luo on 1/22/16.
//  Copyright © 2016 King Luo. All rights reserved.
//

import Foundation

protocol ExampleProtocol {
    var simpleDescription: String {get}
    mutating func adjust()
}

class SimpleClass : ExampleProtocol {
    
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    
    func adjust() {
        simpleDescription += " Now 100% adjusted."
    }
}

var a  = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription
print(aDescription)

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription
print(bDescription)

enum ExampleEnum : ExampleProtocol {
    case Base, Adjusted
    
    var simpleDescription: String {
        get {
            return self.getDescription()
        }
    }
    
    func getDescription() -> String {
        switch self {
        case Base:
            return "A simple description of enum"
        case .Adjusted:
            return "Adjusted description of enum"
        }
    }
    
    mutating func adjust() {
        self = ExampleEnum.Adjusted
    }
}

var c = ExampleEnum.Base
c.adjust()
let cDescription = c.simpleDescription
print(cDescription)


//Extension
extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number is \(self)"
    }
    
    mutating func adjust() {
        self += 42
    }
}

print("7.simpleDescription before adjust is \(7.simpleDescription)")
var seven = 7;
seven.adjust()
print("seven.simpleDescription after adjust is \(seven.simpleDescription)")

let protocolValue: ExampleProtocol = a
print(protocolValue.simpleDescription)

func repeatItem<Item>(item: Item, numberOfTimes: Int) -> [Item]{
    var result = [Item]()
    for _ in 0 ..< numberOfTimes {
        result.append(item)
    }
    
    return  result
}

print(repeatItem("knock", numberOfTimes: 5))


enum OptionalValue<Wrapped>{
    case None
    case Some(Wrapped)
}

var possibleInteger: OptionalValue<Int> = .None
possibleInteger = .Some(100)

func anyCommonElements<T: SequenceType, U: SequenceType where T.Generator.Element: Equatable, T.Generator.Element == U.Generator.Element>(lhs: T, _ rhs: U) -> Bool {
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem{
                return true
            }
        }
    }
    return false
}

print(anyCommonElements([1,2,3], [3]))