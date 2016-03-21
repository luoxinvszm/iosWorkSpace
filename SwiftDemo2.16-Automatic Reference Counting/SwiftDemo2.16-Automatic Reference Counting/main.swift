//
//  main.swift
//  SwiftDemo2.16-Automatic Reference Counting
//
//  Created by King Luo on 11/20/14.
//  Copyright (c) 2014 King Luo. All rights reserved.
//

import Foundation

//class Person {
//    let name: String
//    init(name: String) {
//        self.name = name
//        println("\(name) is being initialized")
//    }
//    deinit {
//        println("\(name) is being deinitialized")
//    }
//}
//
//var reference1: Person?
//var reference2: Person?
//var reference3: Person?
//
//reference1 = Person(name: "John Appleseed")
//// prints "John Appleseed is being initialized"
//reference2 = reference1
//reference3 = reference1
//
//reference1 = nil
//reference2 = nil
//
//reference3 = nil
//// prints "John Appleseed is being deinitialized"


//class Person {
//    let name: String
//    init(name: String) { self.name = name }
//    var apartment: Apartment?
//    deinit { println("\(name) is being deinitialized") }
//}
//
//class Apartment {
//    let number: Int
//    init(number: Int) { self.number = number }
//    var tenant: Person?
//    deinit { println("Apartment #\(number) is being deinitialized") }
//}
//var john: Person?
//var number73: Apartment?
//
//john = Person(name: "John Appleseed")
//number73 = Apartment(number: 73)
//
//john!.apartment = number73
//number73!.tenant = john
//
//john = nil
//number73 = nil

//class Person {
//    let name: String
//    init(name: String) { self.name = name }
//    var apartment: Apartment?
//    deinit { println("\(name) is being deinitialized") }
//}
//
//class Apartment {
//    let number: Int
//    init(number: Int) { self.number = number }
//    weak var tenant: Person?
//    deinit { println("Apartment #\(number) is being deinitialized") }
//}
//var john: Person?
//var number73: Apartment?
//
//john = Person(name: "John Appleseed")
//number73 = Apartment(number: 73)
//
//john!.apartment = number73
//number73!.tenant = john
//
//john = nil
//// prints "John Appleseed is being deinitialized"
//
//number73 = nil
//// prints "Apartment #73 is being deinitialized"


class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit { println("\(name) is being deinitialized") }
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit { println("Card #\(number) is being deinitialized") }
}
var john: Customer?
john = Customer(name: "John Appleseed")
john!.card = CreditCard(number: 1234_5678_9012_3456, customer: john!)
john = nil
// prints "John Appleseed is being deinitialized"
// prints "Card #1234567890123456 is being deinitialized"

class Country {
    let name: String
    let capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
}

class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}
var country = Country(name: "Canada", capitalName: "Ottawa")
println("\(country.name)'s capital city is called \(country.capitalCity.name)")
// prints "Canada's capital city is called Ottawa"


//class HTMLElement {
//    
//    let name: String
//    let text: String?
//    
//    lazy var asHTML: () -> String = {
//        if let text = self.text {
//            return "<\(self.name)>\(text)</\(self.name)>"
//        } else {
//            return "<\(self.name) />"
//        }
//    }
//    
//    init(name: String, text: String? = nil) {
//        self.name = name
//        self.text = text
//    }
//    
//    deinit {
//        println("\(name) is being deinitialized")
//    }
//    
//}
//var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
//println(paragraph!.asHTML())
//// prints "<p>hello, world</p>"
//paragraph = nil

//lazy var someClosure: (Int, String) -> String = {
//    [unowned self] (index: Int, stringToProcess: String) -> String in
//    // closure body goes here
//}

//lazy var someClosure: () -> String = {
//    [unowned self] in
//    // closure body goes here
//}

class HTMLElement {
    
    let name: String
    let text: String?
    
    lazy var asHTML: () -> String = {
        [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        println("\(name) is being deinitialized")
    }
    
}
var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
println(paragraph!.asHTML())
// prints "<p>hello, world</p>"
paragraph = nil
// prints "p is being deinitialized"