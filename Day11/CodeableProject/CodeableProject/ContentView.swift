//
//  ContentView.swift
//  CodeableProject
//
//  Created by Eric Chen on 12/30/20.
//

import SwiftUI

struct ContentView: View {
  // @ObservedObject var users = Users()
    @State var users = [User]()
    
    var body: some View {
        NavigationView{
            List(users/*.users*/, id: \.id){ item in
                
                VStack(alignment: .leading){
                    NavigationLink(destination: DetailView(user: item)){
                        Text(item.name)
                            .font(.headline)
                        
                        Text("\(item.age)")
                    }
                }
                
            }
            .onAppear(perform: loadData)
        }
        
    }
    
    func loadData(){
        guard let url = URL(string:"https://www.hackingwithswift.com/samples/friendface.json") else{
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else{
                print("No data")
                return
            }
            
            if let decoded = try? JSONDecoder().decode([User].self, from: data){
                self.users = decoded
            }

        }.resume()
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
