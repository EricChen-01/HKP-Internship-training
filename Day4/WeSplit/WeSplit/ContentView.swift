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
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    
       var body: some View {
        NavigationView {
            Form{
                Section{
                    Text("Enter amount below:")
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    Picker("Number Of People", selection: $numberOfPeople){
                        ForEach(2 ..< 100){
                            Text("\($0)")
                        }
                    }
                }
                Section{
                    Picker("Tip %", selection: $tipPercentage){
                        ForEach(0 ..< tipPercentages.count){
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section{
                    Text("everyone pays \(checkAmount)")
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
