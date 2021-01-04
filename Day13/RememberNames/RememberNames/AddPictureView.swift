//
//  AddPictureView.swift
//  RememberNames
//
//  Created by Eric Chen on 1/3/21.
//

import SwiftUI

struct AddPictureView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Picture.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Picture.name, ascending: true),
    ]) var pictures: FetchedResults<Picture>
    
    @State private var name = ""
    
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var image: Image?
    let context = CIContext()
    
    var body: some View {
        VStack{
            TextField("Name",text: $name)
                .padding()
            ZStack{
                Rectangle()
                    .fill(Color.secondary)
                if image != nil {
                    image?
                        .resizable()
                        .scaledToFit()
                }else{
                    Text("Select a Photo")
                }
            }
            .onTapGesture {
                self.showingImagePicker = true
            }
            Button("Save"){
                let newPicture = Picture(context: self.moc)
                newPicture.name = self.name
                newPicture.id = UUID()
                try? moc.save()
                
                savesImage(pathName: newPicture.id!.uuidString, inputImage: inputImage)
                
                presentationMode.wrappedValue.dismiss()
            }
        }
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage){
            ImagePicker(image: self.$inputImage)
        }
            
    }
    
    func loadImage() {
            guard let inputImage = inputImage else {return}
        image = Image(uiImage: inputImage)
    }
    
    func savesImage(pathName: String, inputImage: UIImage?) {
            
        let fileName = helper.getDocumentsDirectory().appendingPathComponent(pathName)
            do {
                if let jpegData = inputImage?.jpegData(compressionQuality: 0.8) {
                    try jpegData.write(to: fileName, options: [.atomicWrite, .completeFileProtection])
                }
            } catch {
                print("Unable to save image")
            }
        }
}

struct AddPictureView_Previews: PreviewProvider {
    static var previews: some View {
        AddPictureView()
    }
}
