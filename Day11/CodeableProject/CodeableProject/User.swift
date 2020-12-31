//
//  User.swift
//  CodeableProject
//
//  Created by Eric Chen on 12/30/20.
//

import Foundation
import SwiftUI

struct User: Codable, Identifiable{
    var id: String
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: String
    var tags: [String]
    var friends: [Friends]
}
