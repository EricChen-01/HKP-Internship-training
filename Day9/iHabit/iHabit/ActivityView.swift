//
//  ActivityView.swift
//  iHabit
//
//  Created by Eric Chen on 12/28/20.
//

import SwiftUI

struct ActivityView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var activities: Habits
    var activity: Activity
    @State var completed = 0
    
    var body: some View {
        VStack{
            Text("Title \(self.activity.title)")
                .font(.title)
            Text("Description \(self.activity.description)")
                .font(.body)
            
            HStack{
                Text("Incriment")
                    .padding()
                Stepper(value: $completed, in: activity.count ... Int.max){
                    Text("Times: \(self.completed)")
                }
            }.navigationBarItems(trailing: Button("Save"){
                saveChanges()
                presentationMode.wrappedValue.dismiss()
            })
            .onAppear(){
                self.completed = self.activity.count
            }
            
            Spacer()
            
        }.navigationBarTitle("\(self.activity.title)")
    }
    
    func saveChanges() {
        if let match = self.activities.habits.firstIndex(where: { $0.id == self.activity.id
        }){
            let NewActivity = Activity(title: self.activity.title, description: self.activity.description, count: completed)
            self.activities.habits.remove(at: match)
            self.activities.habits.insert(NewActivity, at: match)
            self.activities.saveChanges()
        }
    }
    
}

struct ActivityView_Previews: PreviewProvider{
    static var previews: some View {
        ActivityView(activities: Habits(), activity: Activity(title: "Title", description: "description", count: 5))
    }
}
