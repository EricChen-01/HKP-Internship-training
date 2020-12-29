//
//  Habits.swift
//  iHabit
//
//  Created by Eric Chen on 12/28/20.
//

import Foundation

class Habits: ObservableObject{
    @Published var habits = [Activity]()
    
    
    func saveChanges() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(habits){
            UserDefaults.standard.set(encoded, forKey: "LIST")
        }
    }
    
    init() {
        if let LIST = UserDefaults.standard.data(forKey: "LIST"){
            let decoder = JSONDecoder()
            
            if let decoded = try? decoder.decode([Activity].self, from: LIST){
                self.habits = decoded
                return
            }
        }
        
        self.habits = []
    }
}
