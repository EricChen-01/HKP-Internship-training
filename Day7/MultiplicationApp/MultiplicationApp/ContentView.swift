//
//  ContentView.swift
//  MultiplicationApp
//
//  Created by Eric Chen on 12/25/20.
//

import SwiftUI


struct Question{
    var text: String
    var answer: Int
}


struct ContentView: View {
    //showing game
    @State private var showingGame = false
    
    //settings
    @State private var gameSelection = 5
    @State private var SelectedQuestions = 0
    let NumberOfQuestions = ["5", "10", "20", "ALL"]
    
    //Game
    @State private var userAnswer = ""
    @State private var correctAnswer = 0
    @State private var gameCount = 0
    @State private var totalScore = 0
    @State private var isCorrect = false
    @State private var isWrong = false
    @State private var questions = [Question]()
    let AllQuestions = Range(1...12)
    @State private var currentQuestion = 0
    @State private var ALL = 0
    @State private var showAlert = false
    @State private var alertTitle = ""
    
    func checkAnswer() {
        correctAnswer = questions[currentQuestion].answer
        let userInputAnswer = Int(userAnswer) ?? 0
        gameCount -= 1
        if(userInputAnswer == correctAnswer){
            totalScore += 1
            if(gameCount == 0){
                alertTitle = "GAME OVER"
                showAlert = true
            }else{
                alertTitle = "Correct!"
                showAlert = true
            }
        }else {
            if(gameCount == 0){
                alertTitle = "GAME OVER"
                showAlert = true
            }else{
                alertTitle = "Wrong!"
                showAlert = true
            }
        }
    }
    
    func newQuestion(){
        currentQuestion += 1
    }
    
        func ArrayOfQuestions() {
         for i in 1 ... gameSelection {
             for j in 1...12 {
                 let newQuestion = Question(text: "How much is: \(i) * \(j) ?", answer: i * j)
                 questions.append(newQuestion)
             }
         }
            
            questions.shuffle()

     }
    
    var body: some View {
        Group{
            VStack {
                    NavigationView{
                        Form{
                            if(showingGame) {
                                //show question
                                Text("This is question number \(gameCount) \n \(questions[currentQuestion].text)")
                                
                                
                                //show numberpad using textfield
                                    TextField("Answer here", text: $userAnswer, onCommit: checkAnswer).keyboardType(.decimalPad)
                                
                                
                                
                                
                                Button("go back") {
                                    ALL = 0
                                    self.showingGame.toggle()
                                }
                            }else{
                                VStack{
                                    Section(header: Text("Settings")){
                                        Text("Choose which Multiplication table you want to practice")
                                        
                                        Stepper(value: $gameSelection, in: 1...12){
                                            Text("You will practice the  \(gameSelection) times table")
                                        }
                                        
                                        Picker("Number Of Questions", selection: $SelectedQuestions){
                                            ForEach( 0 ..< NumberOfQuestions.count){
                                                Text("\(NumberOfQuestions[$0])")
                                            }
                                        }.pickerStyle(SegmentedPickerStyle())
                                        Button("PLAY") {
                                            self.showingGame.toggle()
                                            ArrayOfQuestions()
                                           
                                                for _ in 1 ... gameSelection {
                                                    for _ in 1 ... 12 {
                                                        ALL += 1
                                                    }
                                                }
                                            gameCount = Int(NumberOfQuestions[SelectedQuestions]) ?? ALL
                                        }
                                    }
                                }
                            }
                            
                            
                        }.navigationBarTitle("Multiplication Game")
                        
                    }
                
                
                
                
                
            }
        }.alert(isPresented: $showAlert){
            Alert(title: Text("\(alertTitle)"), message: Text(" You score is: \(totalScore)"), dismissButton: .default(Text("OK")){
                
                if(gameCount > 0){
                    newQuestion()
                }else {
                    
                    alertTitle = ""
                    gameCount = 0
                    totalScore = 0
                    showingGame = false
                    ALL = 0
                    
                }
                
            })
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
