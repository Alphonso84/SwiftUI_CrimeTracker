//
//  ContentView.swift
//  SwiftUI_CrimeTracker
//
//  Created by Alphonso Sensley II on 6/26/20.
//

import SwiftUI

enum City: String, CaseIterable, Identifiable {
    case Oakland
    case Fremont
    case Hayward
    case Berkeley
    case SanLeandro = "San Leandro"
    case Livermore
    case Pleasanton
    case Alameda
    case UnionCity = "Union City"
    case Dublin
    case Newark
    case Emeryville
    case Piedmont
    
    var id: String {self.rawValue}
    
}

struct ContentView: View {
    @State private var selectedCity = "Oakland"
    
    func passDataTo(data:String) {
        var view = CrimeListView()
        view.city = data
    }
    var body: some View {
        NavigationView {
            VStack {
                Image("Icon").padding(.bottom)
                
                Picker("City", selection: $selectedCity) {
                    ForEach(City.allCases) { city in
                        Text(city.rawValue)
                    }
            
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width:1,alignment:.bottom)
                
                 
                Text("City is \(selectedCity)")
                NavigationLink(destination: CrimeListView()) {
                    Text("Get Crimes")
                        .padding(.trailing, 40)
                        .padding(.leading, 40)
                        .padding(/*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                }
                .isDetailLink(true)
                .background(Color.gray)
                .foregroundColor(Color.white)
                .cornerRadius(15)
                
                Image("Image").resizable().frame(width: 300, height: 60, alignment: .center) .aspectRatio(contentMode: .fit)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
