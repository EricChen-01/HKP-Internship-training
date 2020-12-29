//
//  Order.swift
//  CupCake
//
//  Created by Eric Chen on 12/29/20.
//

import Foundation

class Order: ObservableObject, Codable {
    enum CodingKeys: CodingKey {
        case type, quantity, extraFrosting, addSprinkles, name, streetAddress, city, zip
    }
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow" ]
    
    @Published var type = 0
    @Published var quantity = 3
    
    @Published var specialRequestEnabled = false{
        didSet{
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    @Published var extraFrosting = false
    @Published var addSprinkles = false
    
    @Published var name = ""
    @Published var streetAddress = ""
    @Published var city = ""
    @Published var zip = ""
    
    var hasValidAddress: Bool{
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }
        
        return true
    }
    
    var cost: Double {
        var cost = Double(quantity) * 2
        cost += Double(type) / 2
        
        if extraFrosting{
            cost += Double(quantity)
        }
        
        if addSprinkles {
            cost += Double(quantity) / 2
        }
        
        return cost
    }
    
    init() {
        if let type = UserDefaults.standard.data(forKey: "Type"){
            let decoder = JSONDecoder()
            
            if let decoded = try? decoder.decode(Int.self, from: type){
                self.type = decoded
            }
        }
        
        if let quantity = UserDefaults.standard.data(forKey: "Quantity"){
            let decoder = JSONDecoder()
            
            if let decoded = try? decoder.decode(Int.self, from: quantity){
                self.quantity = decoded
                return
            }
        }

        type = 0
        quantity = 3
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        type = try container.decode(Int.self, forKey: .type)
        quantity = try container.decode(Int.self, forKey: .quantity)
        extraFrosting = try container.decode(Bool.self, forKey: .extraFrosting)
        addSprinkles = try container.decode(Bool.self, forKey: .addSprinkles)
        name = try container.decode(String.self, forKey: .name)
        streetAddress = try container.decode(String.self, forKey: .streetAddress)
        city = try container.decode(String.self, forKey: .city)
        zip = try container.decode(String.self, forKey: .zip)
    }
    
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(type, forKey: .type)
        try container.encode(quantity, forKey: .quantity)
        try container.encode(extraFrosting, forKey: .extraFrosting)
        try container.encode(addSprinkles, forKey: .addSprinkles)
        try container.encode(name, forKey: .name)
        try container.encode(streetAddress, forKey: .streetAddress)
        try container.encode(city, forKey: .city)
        try container.encode(zip, forKey: .zip)
    }
    
    func saveChanges(){
        let encoder = JSONEncoder()
        
        if let encodedT = try?
            encoder.encode(type){
            UserDefaults.standard.set(encodedT, forKey: "Type")
        }
        
        if let encodedQ = try?
            encoder.encode(quantity){
            UserDefaults.standard.set(encodedQ, forKey: "Quantity")
        }
        
    }
 
}
