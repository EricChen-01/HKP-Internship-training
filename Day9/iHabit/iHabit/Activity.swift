//
//  Activity.swift
//  iHabit
//
//  Created by Eric Chen on 12/28/20.
//

import Foundation

struct Activity: Identifiable, Codable{
    let id = UUID()
    let title: String
    let description: String
    var count: Int
}
