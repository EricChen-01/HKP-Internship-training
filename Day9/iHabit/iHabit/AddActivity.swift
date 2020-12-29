//
//  AddHabit.swift
//  iHabit
//
//  Created by Eric Chen on 12/28/20.
//

import SwiftUI

struct AddActivity: View {
    @ObservedObject var habitList: Habits
    @Environment(\.presentationMode) var presentationMode
    @State private var title = ""
    @State private var description = ""
    @State private var count = 0
    var body: some View {
        VStack{
            NavigationView{
                Form{
                    TextField("Title", text: $title)
                    TextField("Desription", text: $description)
                    Stepper(value: $count, in: 0 ... Int.max){
                        Text("\(count) times")
                    }
                }.navigationBarTitle("Add New Habit")
                .navigationBarItems(trailing: Button("Save"){
                    let newActivity = Activity(title: title, description: description, count: count)
                    habitList.habits.append(newActivity)
                    habitList.saveChanges()
                    presentationMode.wrappedValue.dismiss()
                })
                
            }
        }
    }
}

struct AddHabit_Previews: PreviewProvider {
    static var previews: some View {
        AddActivity(habitList: Habits())
    }
}
