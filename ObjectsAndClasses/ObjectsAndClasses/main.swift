//
//  main.swift
//  ObjectsAndClasses
//
//  Created by King Luo on 1/9/16.
//  Copyright © 2016 King Luo. All rights reserved.
//

import Foundation

class NameShape {
    
    var numberOfSides = 0
    
    var name: String
    
    let color: String = "red"
    
    init(name: String){
        self.name = name
    }
    
    func simpleDescription() -> String {
        
        return "A shape with \(numberOfSides) sides"
        
    }
}

var shape = NameShape(name: "s")

shape.numberOfSides = 7

var shapeDescription = shape.simpleDescription()

print(shapeDescription)


class Square: NameShape {
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

let testSquare = Square(sideLength: 5.2, name: "my test square")
print("test square's area is \(testSquare.area())")
print(testSquare.simpleDescription())

class Circle: NameShape {
    var radius: Double
    
    init(radius: Double, name: String){
        self.radius = radius
        super.init(name: name)
        numberOfSides = 0
    }
    
    func area() -> Double {
        return 3.141592656 * radius * radius
    }
    
    override func simpleDescription() -> String {
        return "A circle with radius of length \(radius)"
    }
}

let testCircle = Circle(radius: 23, name: "my test circle")
print("test circle's area is \(testCircle.area())")
print(testCircle.simpleDescription())

//getter and setter
class EquilateralTriangle: NameShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String){
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
        return "An equilateral triangle with sides of length \(sideLength)"
    }
}
let triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print("the perimeter of triangle is \(triangle.perimeter)")
triangle.perimeter = 9.9
print("the new perimeter is \(triangle.perimeter)")

//willset and didset
class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet 
    }
}