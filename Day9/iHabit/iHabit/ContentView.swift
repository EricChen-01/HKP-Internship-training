//
//  ContentView.swift
//  iHabit
//
//  Created by Eric Chen on 12/28/20.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingAddHabit = false
    @ObservedObject var habitsList = Habits()
    var body: some View {
        NavigationView{
            VStack{
                List{
                    ForEach(habitsList.habits){ item in
                        HStack{
                            NavigationLink(destination: ActivityView(activities: habitsList, activity: item)) {
                                Text(item.title)
                                Spacer()
                                Text("\(item.count)")
                            }
                        }
                    }.onDelete(perform: removeItems)
                }
                Spacer()
            }.navigationBarTitle("iTracker")
            .navigationBarItems(trailing:
                    Button(action: {
                        isShowingAddHabit.toggle()
                    }){
                        Image(systemName: "plus")
                    }
            )
        }
        .sheet(isPresented: $isShowingAddHabit){
            AddActivity(habitList: habitsList)
        }

    }
    
    func removeItems(at Offsets: IndexSet){
        habitsList.habits.remove(atOffsets: Offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
