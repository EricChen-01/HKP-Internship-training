//
//  DetailView.swift
//  RememberNames
//
//  Created by Eric Chen on 1/3/21.
//

import SwiftUI
import MapKit

struct DetailView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Picture.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Picture.name, ascending: true)
    ]) var pictures: FetchedResults<Picture>
    @State private var inputImage: UIImage?
    @State private var image: Image?
    @State var person: Picture
    
    //MapKit
    @State private var location = CLLocationCoordinate2D()
    @State private var locations = [CodableMKPointAnnotation]()
    
    var body: some View {
        VStack{
            Text("\(person.name!)")
                .font(.title)
                .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                .padding()
            if image != nil {
                image?
                    .resizable()
                    .scaledToFit()
            }else{
                Text("Image Not Found")
            }
            
            ZStack{
                MapView(centerCoordinate: $location, annotations: locations)
            }
        }
        .onAppear{
            self.loadImage()
            self.loadLocations()
        }
    }
    
    
    func loadLocations() {
        let filename = helper.getDocumentsDirectory().appendingPathComponent(person.locationID!.uuidString)
        
        do {
            let data = try Data(contentsOf: filename)
            location = CLLocationCoordinate2D(latitude: 0, longitude: 0)
            locations = try JSONDecoder().decode([CodableMKPointAnnotation].self, from: data)
        }catch{
            print("unable to load locations. \(error.localizedDescription)")
        }
    }
    
    func loadImage() {
        let data = helper.loadImage(imageIdName: person.id!.uuidString)
            guard  let loadedData = data else {
                return
            }
            self.inputImage =  UIImage(data: loadedData)
            self.image = Image(uiImage: inputImage!)
        }
    
}
