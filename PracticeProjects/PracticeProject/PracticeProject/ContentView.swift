//
//  ContentView.swift
//  PracticeProject
//
//  Created by Eric Chen on 12/27/20.
//

import SwiftUI

class itemsArray: ObservableObject{
    @Published var array = [items](){
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(array){
                UserDefaults.standard.set(encoded, forKey: "list")
            }
        }
    }
    
    init(){
        if let item = UserDefaults.standard.data(forKey: "list"){
            let decoder = JSONDecoder()
            
            if let decoded = try?
                decoder.decode([items].self, from: item) {
                self.array = decoded
                return
            }
        }
    }
}

struct items: Identifiable, Codable{
    let id = UUID()
    let name: String
    let amount: Int
    let price: Int
}


struct ContentView: View {
    @ObservedObject var Items = itemsArray()
    var body: some View {
        NavigationView{
            Form{
                NavigationLink(destination: AddItems(itemsArray: Items)){
                    Text("Click me to start")
                }
                List{
                    ForEach(Items.array){items in
                        HStack{
                            Text(items.name)
                            Spacer()
                            Text("$\(items.price)")
                        }
                    }
                }
            }
        }.navigationBarTitle("HI")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
