//
//  CheckOutView.swift
//  CupCake
//
//  Created by Eric Chen on 12/29/20.
//

import SwiftUI

struct CheckOutView: View {
    @ObservedObject var order: Order
    @State private var confirmatonMessage = ""
    @State private var showingConfirmation = false
    
    var body: some View {
        GeometryReader{ geo in
            ScrollView{
                VStack{
                    Image("cupcakes")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width)
                    
                    Text("Your total is $\(order.cost, specifier: "%.2f")")
                        .font(.title)
                    
                    Button("Place Order"){
                        placeOrder()
                    }
                    .padding()
                }
            }
        }
        .navigationBarTitle("Check Out", displayMode: .inline)
        .alert(isPresented: $showingConfirmation){
            Alert(title: Text("Your order has been placed"), message: Text(confirmatonMessage), dismissButton: .default(Text("OK")))
        }
    }
    
    func placeOrder() {
        guard let encoded = try? JSONEncoder().encode(order)
        else{
            print("Failed to encode order")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = encoded
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print("No data in response \(error?.localizedDescription ?? "unknown error.").")
                return
            }
            
            if let decodedOrder = try? JSONDecoder().decode(Order.self, from: data){
                confirmatonMessage = "Your order for \(decodedOrder.quantity)x \(Order.types[decodedOrder.type].lowercased()) is on its way!"
                showingConfirmation = true
            } else {
                print("Invalid response from server")
            }
        }.resume()
    }
}

struct CheckOutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckOutView(order: Order())
    }
}
