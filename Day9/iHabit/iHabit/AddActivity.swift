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
    var body: some View {
        VStack{
            NavigationView{
                Form{
                    TextField("Title", text: $title)
                    TextField("Desription", text: $description)
                }.navigationBarTitle("Add New Habit")
                .navigationBarItems(trailing: Button("Save"){
                    let habit = Activity(title: title, description: description)
                    habitList.habits.append(habit)
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
