//
//  AddItems.swift
//  PracticeProject
//
//  Created by Eric Chen on 12/27/20.
//

import SwiftUI

struct AddItems: View {
    @ObservedObject var itemsArray: itemsArray
    @Environment(\.presentationMode) var presentationMode
    @State private var name = ""
    @State private var amount = ""
    @State private var price = ""
    var body: some View {
        NavigationView{
            Form{
                TextField("Name", text: $name)
                TextField("Amount", text: $amount)
                TextField("Price", text: $price)
            }.navigationBarTitle("Items")
            .navigationBarItems(trailing: Button("Save"){
                if let actualAmount = Int(amount){
                    if let actualPrice = Int(price){
                        let item = items(name: name, amount: actualAmount, price: actualPrice)
                        itemsArray.array.append(item)
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            })
        }
    }
}

struct AddItems_Previews: PreviewProvider {
    static var previews: some View {
        AddItems(itemsArray: itemsArray())
    }
}
