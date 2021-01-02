//
//  ContentView.swift
//  BucketList
//
//  Created by Eric Chen on 1/2/21.
//

import MapKit
import LocalAuthentication
import SwiftUI

struct ContentView: View {
    @State private var centerCoordinate = CLLocationCoordinate2D()
    @State private var isUnlocked = false
    @State private var locations = [CodableMKPointAnnotation]()
    @State private var selectedPlace: MKPointAnnotation?
    @State private var showingPlaceDetails = false
    @State private var showingEditScreen = false
    
    var body: some View {
        ZStack{
            MapView(centerCoordinate: $centerCoordinate, selectedPlace: $selectedPlace, showingPlaceDetails: $showingPlaceDetails, annocations: locations)
                .edgesIgnoringSafeArea(.all)
            Circle()
                .fill(Color.blue)
                .opacity(0.3)
                .frame(width: 32, height: 32)
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    Button(action: {
                        let newLocation = CodableMKPointAnnotation()
                        //newLocation.title = "Unknown"
                        newLocation.coordinate = self.centerCoordinate
                        self.locations.append(newLocation)
                        
                        self.selectedPlace = newLocation
                        self.showingEditScreen = true
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
        }
        .alert(isPresented: $showingPlaceDetails ){
            Alert(title: Text(selectedPlace?.title ?? "Unknown"), message: Text(selectedPlace?.subtitle ?? "Unknown"), primaryButton: .default(Text("OK")), secondaryButton: .default(Text("Edit")){
                self.showingEditScreen = true
            })
        }
        .sheet(isPresented: $showingEditScreen, onDismiss: saveData){
            if self.selectedPlace != nil {
                EditView(placemark: selectedPlace!)
            }
        }
        .onAppear(perform: loadData)
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            let reason = "We need to unlock your data"
            
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) {
                success, authenticateError in
                DispatchQueue.main.async {
                    if success {
                        self.isUnlocked = true
                    }else{
                        // problem
                    }
                }
            }
        }else{
            // no biometrics
        }
        
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func loadData(){
        let filename = getDocumentsDirectory().appendingPathComponent("SavedPlaces")
        
        do {
            let data = try Data(contentsOf: filename)
            locations = try JSONDecoder().decode([CodableMKPointAnnotation].self, from: data)
        } catch {
            print("Unable to load saved data")
        }
    }
    
    func saveData(){
        do {
            let filename = getDocumentsDirectory().appendingPathComponent("SavedPlaces")
            let data = try JSONEncoder().encode(self.locations)
            try data.write(to: filename, options: [.atomicWrite, .completeFileProtection])
        }catch{
            print("unable to save data")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
