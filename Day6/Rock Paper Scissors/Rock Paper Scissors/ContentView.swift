//
//  ContentView.swift
//  Rock Paper Scissors
//
//  Created by Eric Chen on 12/22/20.
//

import SwiftUI

struct ContentView: View {
    let moves = ["Rock", "Paper", "Scissors"]
    @State private var appChoice = Int.random(in: 0 ..< 3)
    @State private var shouldWin = Bool.random()
    
    
    @State private var score = 0
    @State private var gameCount = 0
    
    @State private var GameIs10 = false
    @State private var endScore = ""
    
    func askQuestion() {
        appChoice = Int.random(in: 0 ..< 3)
        shouldWin = Bool.random()
    }
    
    func end() {
        endScore = "\(score)"
        GameIs10 = true
    }
    
    var body: some View {
        HStack(spacing: 30){
            VStack{
                HStack {
                    NavigationView{
                        Form{
                            Section(header: Text("Board")){
                                if(shouldWin){
                                    Text("WIN")
                                }else {
                                    Text("LOSE")
                                }
                                Text("\(moves[appChoice])")
                            }
                            
                            Section(header: Text("Choices")){
                                ForEach(0 ..< 3) { number in
                                    Button(action: {
                                        // if WIN
                                        if(shouldWin){
                                            if((number - appChoice) == 0){
                                                score -= 1
                                                gameCount += 1
                                            }else if (number - appChoice > 1){
                                                score -= 1
                                                gameCount += 1
                                            }else {
                                                score += 1
                                                gameCount += 1
                                            }
                                        }else {
                                            if((number - appChoice) == 0){
                                                score += 1
                                                gameCount += 1
                                            }else if (number - appChoice > 1){
                                                score += 1
                                                gameCount += 1
                                            }else {
                                                score -= 1
                                                gameCount += 1
                                            }
                                        }
                                        
                                     
                                       
                                        
                                        // repeat game over
                                        if(gameCount < 10){
                                            self.askQuestion()
                                        }else{
                                            self.end()
                                        }
                                    }, label: {
                                        Text("\(moves[number])")
                                    })
                                }
                            }
                            
                            Section{
                                Text("Score is \(score)")
                                Text("Game Number is \(gameCount)")
                            }

                        }.navigationBarTitle("Rock Paper Scissors")
                    }
                }
            }
        }.alert(isPresented: $GameIs10){
            Alert(title: Text("Game Over"), message: Text("Your Score is \(endScore)"),dismissButton: .default(Text("OK")))
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
