//
//  ContentView.swift
//  iExpense
//
//  Created by Eric Chen on 12/26/20.
//

import SwiftUI

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem](){
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(items){
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init(){
        if let items = UserDefaults.standard.data(forKey: "Items"){
            let decoder = JSONDecoder()
            
            if let decoded = try?
                decoder.decode([ExpenseItem].self , from: items) {
                self.items = decoded
                return
            }
        }
    
        
        self.items = [ExpenseItem]()
    }
}

struct ExpenseItem: Identifiable, Codable{
    let id = UUID()
    let name: String
    let type: String
    let amount: Int
}

struct ContentView: View {
    @ObservedObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView{
            List{
                ForEach(expenses.items){ item in
                    HStack{
                        VStack{
                            Text(item.name).font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        Text("$\(item.amount)")
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationBarTitle("iExpense")
            .navigationBarItems(trailing:
                Button(action:{
                    showingAddExpense = true
                }){
                    Image(systemName: "plus")
                }
            ).sheet(isPresented: $showingAddExpense){
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet){
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
