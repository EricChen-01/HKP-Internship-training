//
//  AddPictureView.swift
//  RememberNames
//
//  Created by Eric Chen on 1/3/21.
//

import SwiftUI
import MapKit

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
    
    //map vars
    @State private var centerCoordinate = CLLocationCoordinate2D()
    @State private var locations = [CodableMKPointAnnotation]()
    let locationFetcher = LocationFetcher()
    
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
            
            ZStack{
                //map
                MapView(centerCoordinate: $centerCoordinate, annotations: locations)
                Circle()
                    .fill(Color.blue)
                    .opacity(0.3)
                    .frame(width: 32.0, height: 32)
                
                //button here to add pointer
                VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        Button(action: {
                            let newLocation = CodableMKPointAnnotation()
                            newLocation.coordinate = self.centerCoordinate
                            newLocation.title = "\(name)"
                            newLocation.subtitle = ""
                            self.locations.append(newLocation)

                        }){
                            Image(systemName: "plus")
                        }
                        .padding()
                        .background(Color.black.opacity(0.75))
                        .foregroundColor(.white)
                        .font(.title)
                        .clipShape(Circle())
                        .padding(.trailing)
                    }
                }
                
                //save pointer
            }
            .onAppear{
                self.locationFetcher.start()
            }
            .padding()
            Button("Save"){
                let newPicture = Picture(context: self.moc)
                newPicture.name = self.name
                newPicture.id = UUID()
                newPicture.locationID = UUID()
                try? moc.save()
                
                savesImage(Name: newPicture.id!.uuidString, inputImage: inputImage)
                saveLocations(name: newPicture.locationID!.uuidString )
                
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
        
        if let location = self.locationFetcher.lastKnownLocation{
            let newLocation = CodableMKPointAnnotation()
            newLocation.coordinate = location
            newLocation.title = "\(name)"
            newLocation.subtitle = ""
            self.locations.append(newLocation)
        }
    }
    
    func savesImage(Name: String, inputImage: UIImage?) {
            
        let fileName = helper.getDocumentsDirectory().appendingPathComponent(Name)
            do {
                if let jpegData = inputImage?.jpegData(compressionQuality: 0.8) {
                    try jpegData.write(to: fileName, options: [.atomicWrite, .completeFileProtection])
                }
            } catch {
                print("Unable to save image")
            }
    }
    
    func saveLocations(name: String){
        do {
            let filename = helper.getDocumentsDirectory().appendingPathComponent(name)
            let data = try JSONEncoder().encode(self.locations)
            try data.write(to: filename, options: [.atomicWrite, .completeFileProtection])
        } catch{
            print("unable to save locacation")
        }
    }
}

struct AddPictureView_Previews: PreviewProvider {
    static var previews: some View {
        AddPictureView()
    }
}
