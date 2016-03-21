//
//  main.swift
//  EnumerationsAndStructures
//
//  Created by King Luo on 1/22/16.
//  Copyright © 2016 King Luo. All rights reserved.
//

import Foundation

//enumeration
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
            
            return String (self.rawValue)
        }
    }
    
    func compare(rhs: Rank) -> Bool {
    
        if(self.rawValue == rhs.rawValue){
            return true
        }
        return false
    
    }
    
    static let allValues = [Ace, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King]
}

let ace = Rank.Ace

let aceRawValue = ace.rawValue

let jack = Rank.Jack

print("aceRawValue is \(aceRawValue)")
print("ace raw value description is \(ace.simpleDescription())")
print("rank compare is \(jack.compare(ace))")

if let convertRank = Rank(rawValue: 3) {
    let threeDescription = convertRank.simpleDescription()
    print("threeDescription is \(threeDescription)")
}

enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    
    func simpleDescription() -> String{
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
    
    func color() -> String {
        
        switch self {
        case .Spades, .Clubs:
            
            return "black"
        case .Hearts, .Diamonds:
            
            return "red"
        }
    }
    
    static let allValues = [Spades, Hearts, Diamonds, Clubs]
}

let hearts = Suit.Hearts

let heartsDescription = hearts.simpleDescription()

let heartsColor = hearts.color()

print("hearts' description is \(heartsDescription)")
print("hearts' color is \(heartsColor)")


//structure
struct Card {
    var rank: Rank
    var suit: Suit
    
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
    
    func createFullDeckOfCards() -> [Card] {
        
        var cards: [Card] = []
        
        let suits: [Suit] = [.Spades, .Hearts, .Clubs, .Diamonds]
        
        
        for i in 1...13 {
            for suit in suits {
                cards.append(Card(rank: Rank(rawValue: i)!, suit: suit))
            }
        }
        return cards
        
    }
}

let threeOfSpades = Card(rank: .Three, suit: .Spades)

let threeOfSpadesDescription = threeOfSpades.simpleDescription()

print("three of spades' description is \(threeOfSpadesDescription)")

let cards = threeOfSpades.createFullDeckOfCards()

for c in cards {
        print(c.simpleDescription())
}

enum ServerResponse {
    case Result(String, String)
    case Error(String)
}

let success = ServerResponse.Result("6:00 am", "8:09 pm")
let failure = ServerResponse.Error("Out of cheese")

switch success {
case let .Result(sunrise, sunset):
    
    print("Sunrise is at \(sunrise) and sunset is at \(sunset)")
case let .Error(error):
    
    print("Failure... \(error)")
}
