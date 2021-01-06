//
//  PreviousRollsView.swift
//  DiceRoller
//
//  Created by Eric Chen on 1/6/21.
//

import SwiftUI

struct PreviousRollsView: View {
    @EnvironmentObject var dices: Dices

    
    var body: some View {
        NavigationView{
            List{
                ForEach(dices.dices){ index in
                    VStack{
                        Text("🎲 \(index.number)")
                            .padding()
                    }
                }
            }
            .navigationBarTitle("Previous Rolls")
        }
    }
}

struct PreviousRollsView_Previews: PreviewProvider {
    static var previews: some View {
        PreviousRollsView()
    }
}
