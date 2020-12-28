//
//  Habits.swift
//  iHabit
//
//  Created by Eric Chen on 12/28/20.
//

import Foundation

class Habits: ObservableObject{
    @Published var habits = [Activity]()
}
