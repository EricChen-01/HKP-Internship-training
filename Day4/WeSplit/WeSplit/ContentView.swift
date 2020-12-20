//
//  ContentView.swift
//  WeSplit
//
//  Created by Eric Chen on 12/19/20.
//

import SwiftUI

struct ContentView: View {
    let tipPercentages = [0,10,15,20,25]
    @State private var checkAmount = ""
    @State private var people = ""
    @State private var tipPercentage = 2
    
    
    var totalAmount: Double {
        let tip = Double(tipPercentages[tipPercentage])
        let total = Double(checkAmount) ?? 0
        return total * (1 + (tip / 100.0))
    }
    
    var totalPerPerson: Double {
        let peopleCount = Double(people) ?? 1.0
        let tip = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        return  orderAmount * (1 + (tip / 100.0)) / peopleCount
    }
    
    
       var body: some View {
        NavigationView {
            Form{
                Section(header: Text("Enter total amount below")){
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)

                    TextField("Number Of People (Default is 1)" , text: $people)
                        .keyboardType(.decimalPad)
                }
                Section(header:  Text("How much tip you want to leave?")){
                    Picker("Tip %", selection: $tipPercentage){
                        ForEach(0 ..< tipPercentages.count){
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }.padding().pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Amount Per Person")){
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
                Section(header: Text("Total Amount")){
                    Text("$\(totalAmount, specifier: "%.2f")")
                }
            }.navigationBarTitle("WeSplit")
        }
       }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
