//
//  ContentView.swift
//  DiceRoller
//
//  Created by Eric Chen on 1/6/21.
//

import SwiftUI

struct ContentView: View {
    
    var dices = Dices()
    
    var body: some View {
        TabView{
            RollDiceView()
                .tabItem {
                    Image(systemName: "07.square.fill")
                    Text("Roll Dice")
                }
            PreviousRollsView()
                .tabItem {
                    Image(systemName: "dot.square.fill")
                    Text("All Dice Rolls")
                }
        }
        .environmentObject(dices)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
