//
//  Card.swift
//  FlashZilla
//
//  Created by Eric Chen on 1/6/21.
//

import Foundation

struct Card: Codable{
    let prompt: String
    var answer: String
    
    static var example: Card {
        Card(prompt: "Who played the 13th in Docter Who", answer: "Jodie Whittaker")
    }
    
}
