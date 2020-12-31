//
//  Users.swift
//  CodeableProject
//
//  Created by Eric Chen on 12/30/20.
//


import Foundation
import SwiftUI

class Users: ObservableObject{
   @Published var users = [User]()
    
    
    init(){
        guard let url = URL(string:"https://www.hackingwithswift.com/samples/friendface.json") else{
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else{
                print("No data")
                return
            }
            
            if let decoded = try? JSONDecoder().decode([User].self, from: data){
                self.users = decoded
            }

        }.resume()
    }
}

