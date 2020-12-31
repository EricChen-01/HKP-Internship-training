//
//  DetailView.swift
//  CodeableProject
//
//  Created by Eric Chen on 12/30/20.
//

import SwiftUI

struct DetailView: View {
    var user: User
    @State private var showSheet = false
   // var users: Users
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("\(user.name)")){
                    HStack{
                        Text(user.name)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        Spacer()
                        HStack{
                            VStack{
                                Text("Age")
                                Text("\(user.age)")
                                   .foregroundColor(Color(.gray))
                                Text("Active")
                                Text("\(user.isActive ?"Yes" :"No")")
                                   .foregroundColor(Color(.gray))
                            }
                        }
                    }
                    HStack{
                        VStack{
                            Text("Email: ")
                            Text("\(user.email)")
                                .foregroundColor(Color(.gray))
                        }
                        Spacer()
                        VStack{
                            Text("Company: ")
                            Text("\(user.company)")
                                .foregroundColor(Color(.gray))
                        }
                    }
                }
                
                Section(header: Text("Address")){
                    Text(user.address)
                }
                
                Section(header: Text("About")){
                    Text("\(user.about)")
                }
                
                Section(header: Text("Friends")){
                    List(user.friends, id: \.id){ friend in
                        
                    }
                }
            }
            .navigationBarTitle("\(user.name)")
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(user: User(id: "ID", isActive: true, name: "Bob Ross", age: 19, company: "HKP", email: "bobross@Bobross.edu", address: "bobross st", about: "bobross is famous AND Occaecat consequat elit aliquip magna laboris dolore laboris sunt officia adipisicing reprehenderit sunt. Do in proident consectetur labore. Laboris pariatur quis incididunt nostrud labore ad cillum veniam ipsum ullamco. Dolore laborum commodo veniam nisi. Eu ullamco cillum ex nostrud fugiat eu consequat enim cupidatat. Non incididunt fugiat cupidatat reprehenderit nostrud eiusmod eu sit minim do amet qui cupidatat. Elit aliquip nisi ea veniam proident dolore exercitation irure est deserunt.\r\n", registered: "today", tags: ["famoous", "SO FAMOUS"], friends: [Friends(id: "FRIEND ID", name: "ERIC CHEN")]) /*, users: Users() */)
    }
}
