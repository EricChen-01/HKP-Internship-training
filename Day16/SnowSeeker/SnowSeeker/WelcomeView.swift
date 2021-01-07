//
//  WecomeView.swift
//  SnowSeeker
//
//  Created by Eric Chen on 1/7/21.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack{
            Text("Welcome to SnowSeeker!")
                .font(.largeTitle)
            Text("Please select a resport from the left-hand menue; swift from the left edge to show it.")
                .foregroundColor(.secondary)
        }
    }
}

struct WecomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
