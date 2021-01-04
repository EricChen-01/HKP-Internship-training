//
//  ContentView.swift
//  RememberNames
//
//  Created by Eric Chen on 1/3/21.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Picture.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Picture.name, ascending: true)
    ]) var pictures: FetchedResults<Picture>
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationView{
                List{
                    ForEach(pictures, id: \.self){ item in
                        NavigationLink(destination: DetailView(person: item).environment(\.managedObjectContext, self.moc)){
                            VStack(alignment: .leading){
                                Text(item.name ?? "unknown title")
                                    .font(.headline)
                            }
                        }
                    }
                    .onDelete(perform: deletePictures)
                }
                    .navigationBarTitle("iList")
                    .navigationBarItems(leading: EditButton(), trailing: Button(action: {
                            self.showingAddScreen.toggle()
                    }){
                        Image(systemName: "plus")
                    })
                    .sheet(isPresented: $showingAddScreen){
                        AddPictureView().environment(\.managedObjectContext, self.moc)
                    }
        }
    }
    
    
    func deletePictures(at offSets: IndexSet) {
        for offset in offSets {
            let picture = pictures[offset]
            moc.delete(picture)
        }
        
        try? moc.save()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
