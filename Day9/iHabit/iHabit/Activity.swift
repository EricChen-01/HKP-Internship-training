//
//  Activity.swift
//  iHabit
//
//  Created by Eric Chen on 12/28/20.
//

import Foundation

struct Activity: Identifiable{
    let id = UUID()
    let title: String
    let description: String
    var times: Int
    
    init(title: String, description: String) {
            self.title = title
            self.description = description
            self.times = 0
    }
}
