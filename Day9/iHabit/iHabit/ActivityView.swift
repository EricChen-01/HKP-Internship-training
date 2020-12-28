//
//  ActivityView.swift
//  iHabit
//
//  Created by Eric Chen on 12/28/20.
//

import SwiftUI

struct ActivityView: View {
   
    var activity: Activity
    
    var body: some View {
        VStack{
            Text("\(activity.title)")
                .font(.title)
            Text("\(activity.description)")
                .font(.body)
            
            HStack{
                Text("Incriment")
                    .padding()
                Button("Times Completed \(activity.times)"){
                   //
                }
            }.navigationBarItems(trailing: Button("Save"){

            })
            
            Spacer()
            
        }.navigationBarTitle(activity.title)
    }
    
}

