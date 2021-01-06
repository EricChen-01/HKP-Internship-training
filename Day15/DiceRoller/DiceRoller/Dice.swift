//
//  Dice.swift
//  DiceRoller
//
//  Created by Eric Chen on 1/6/21.
//

import Foundation
import SwiftUI

class Dices: ObservableObject{
    @Published var dices: [Dice]
    static let saveKey = "SavedData"
    
    init(){
        
        if let data = UserDefaults.standard.data(forKey: Self.saveKey){
            if let decoded = try? JSONDecoder().decode([Dice].self, from: data) {
                self.dices = decoded
                return
            }
        }
        
        self.dices = []
    }
    
    func add(_ dice: Dice){
        dices.append(dice)
        save()
    }
    
    private func save(){
         
        if let encoded = try? JSONEncoder().encode(dices){
            UserDefaults.standard.set(encoded, forKey: Self.saveKey)
        }
    }
    
    
}

class Dice: Identifiable, Codable{
    var id = UUID()
    var number = 0
}
