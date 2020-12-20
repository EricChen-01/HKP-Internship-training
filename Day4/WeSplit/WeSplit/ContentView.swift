//
//  ContentView.swift
//  WeSplit
//
//  Created by Eric Chen on 12/19/20.
//

import SwiftUI

struct ContentView: View {
    let tipPercentage = [10,20,30,40,50]
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    
    
    
       var body: some View {
        Form{
            Section{
                Text("Enter amount below:")
                TextField("Amount", text: $checkAmount)
                    .keyboardType(.decimalPad)
            }
            Section{
                Text("everyone pays \(checkAmount)")
            }
        }
       }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
