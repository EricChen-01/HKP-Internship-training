//
//  DetailView.swift
//  RememberNames
//
//  Created by Eric Chen on 1/3/21.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Picture.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Picture.name, ascending: true)
    ]) var pictures: FetchedResults<Picture>
    @State private var inputImage: UIImage?
    @State private var image: Image?
    @State var person: Picture
    
    var body: some View {
        VStack{
            
            if image != nil {
                image?
                    .resizable()
                    .scaledToFit()
                Text("\(person.name!)")
            }else{
                Text("Image Not Found")
            }
        }
        .onAppear{ self.loadImage() }
    }
    
    
    func loadImage() {
        let data = helper.loadImage(pathName: person.id!.uuidString)
            guard  let loadedData = data else {
                return
            }
            self.inputImage =  UIImage(data: loadedData)
            self.image = Image(uiImage: inputImage!)
        }
    
}

/*
struct DetailView_Previews: PreviewProvider {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Picture.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Picture.name, ascending: true)
    ]) var pictures: FetchedResults<Picture>
    static var previews: some View {
        DetailView(person: pictures[0])
    }
}
 */
