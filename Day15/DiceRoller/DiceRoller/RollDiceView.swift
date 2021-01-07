//
//  RollDiceView.swift
//  DiceRoller
//
//  Created by Eric Chen on 1/6/21.
//

import SwiftUI

struct RollDiceView: View {
    @EnvironmentObject var dices: Dices
    @State private var highEnd = 6
    
    @State var random = 1
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                ZStack{
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
                        .frame(width: 200, height: 200)
                        .padding()
                    
                    Text("\(random)")
                        .font(.title)
                        .padding()
                }
                VStack{
                    Button("Roll \(highEnd) sided Dice"){
                        random = Int.random(in: 1 ... highEnd)
                        
                        let newDice = Dice()
                        newDice.number = random
                        self.dices.add(newDice)
                    }
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .navigationBarItems(trailing: Button(action: {
                        dices.dices = []
                    }){
                        Text("🎲 Reset")
                    })
                    .padding()
                    
                    Button("4 Sided Dice"){
                        highEnd = 4
                    }
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .padding()
                    
                    Button("6 Sided Dice"){
                        highEnd = 6
                    }
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .padding()
                    
                    Button("8 Sided Dice"){
                        highEnd = 8
                    }
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .padding()
                }
                Spacer()
            }
            .navigationBarTitle("Roll a Dice")
        }
            
        }
    }

struct RollDiceView_Previews: PreviewProvider {
    static var previews: some View {
        RollDiceView()
    }
}
