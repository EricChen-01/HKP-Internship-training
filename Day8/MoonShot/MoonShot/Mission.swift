//
//  Mission.swift
//  MoonShot
//
//  Created by Eric Chen on 12/27/20.
//

import Foundation


struct Mission: Codable, Identifiable{
    
    struct CrewRole: Codable{
        let role: String
        let name: String
    }
    
    let id: Int
    let launchDate: String?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
}
