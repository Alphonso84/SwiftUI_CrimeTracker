//
//  ContentView.swift
//  SwiftUI_CrimeTracker
//
//  Created by Alphonso Sensley II on 6/26/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            
            Image("Icon").padding(.bottom)
           
            Picker(selection: .constant(1), label: Text("Picker")
                    .multilineTextAlignment(.center)
                    .padding(0.0)) /*@START_MENU_TOKEN@*/{
                Text("Oakland").tag(1)
                Text("Fremont").tag(2)
                Text("Hayward").tag(3)
                Text("Berkeley").tag(4)
                Text("San Leandro").tag(5)
                Text("Livermore").tag(6)
                Text("Pleasanton").tag(7)
                Text("Alameda").tag(8)
                Text("Union City").tag(9)
                Text("Dublin").tag(10)
            }.frame(width:100, alignment: .bottom).padding(.bottom)
            
           
            Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                Text("Get Crime Data")
                    .frame(width: 300.0, height: 50)
            }
           
            .background(Color.gray)
            .foregroundColor(Color.white)
            .frame(width: 300.0, height: 50.0)
            .cornerRadius(15)
            
            
            Image("Image").resizable().frame(width: 300, height: 100, alignment: .center) .aspectRatio(contentMode: .fit)
            
        }/*@END_MENU_TOKEN@*/
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
