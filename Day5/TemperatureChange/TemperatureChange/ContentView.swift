//
//  ContentView.swift
//  TemperatureChange
//
//  Created by Eric Chen on 12/21/20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var temperature = ""
    @State private var tempName = 0
    @State private var convertTemp = 0
    let tempList = ["Celsius", "Fahrenheit","Kelvin"]

    
    
    
    var Conversion: Double {
        
        let temperatureAsANumber = Double(temperature) ?? 0
        
        if(tempName == convertTemp){
            return temperatureAsANumber
        }
        
        
        switch tempName {
        case 0:
            if(convertTemp == 1){
                return 1.8 * temperatureAsANumber + 32
            }else if (convertTemp == 2){
                return temperatureAsANumber + 273.15
            }
        case 1:
            if(convertTemp == 0){
                return ( (temperatureAsANumber-32) * 5 ) / 9.0
            }else if(convertTemp == 2){
                return ( ( (temperatureAsANumber-32) * 5 ) / 9.0 ) + 273.15
            }
        default:
            if(convertTemp == 0){
                return temperatureAsANumber - 273.15
            }else if(convertTemp == 1){
                return ( ((temperatureAsANumber - 273.15) * 9) / 5.0 ) + 32
            }
        }
        return 0.0
    }
    
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Enter temperature")){
                    TextField("Temperature" , text: $temperature)
                        .keyboardType(.decimalPad)
                    Picker("what temp is this?" , selection: $tempName){
                        ForEach(0 ..< tempList.count){
                            Text("\(tempList[$0])")
                        }
                    }
                    .padding().pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Convert to which unit?")){
                    Picker("what temp is this?" , selection: $convertTemp){
                        ForEach(0 ..< tempList.count){
                            Text("\(tempList[$0])")
                        }
                    }
                    .padding().pickerStyle(SegmentedPickerStyle())
                }
            
                
                
                Section(header: Text("Converted Unit")){
                    Text("\(Conversion , specifier: "%.2f")")
                }
                
                
            }.navigationBarTitle("Temperature Conversion")
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
