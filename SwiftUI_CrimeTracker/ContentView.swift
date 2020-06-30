//
//  ContentView.swift
//  SwiftUI_CrimeTracker
//
//  Created by Alphonso Sensley II on 6/26/20.
//

import SwiftUI
import MapKit

class Helper: ObservableObject {
    @Published var location = String()
   // @Published var city = String()
    @Published var here = CLLocationCoordinate2D()
    
    
    func cityMapShouldShow(city:String) ->CLLocationCoordinate2D {
        here = CLLocationCoordinate2D()
        
        switch city {
        case "OAKLAND":
            here = oakland
        case "FREMONT":
            here = fremont
        case "HAYWARD":
            here = hayward
        case "BERKELEY":
            here = berkeley
        case "SAN LEANDRO":
            here = sanLeandro
        case "LIVERMORE":
            here = livermore
        case "PLEASANTON":
            here = pleasanton
        case "ALAMEDA":
            here = alameda
        case "UNION CITY":
            here = unionCity
        case "DUBLIN":
            here = dublin
        case "NEWARK":
            here = newark
        case "EMERYVILLE":
            here = emeryville
        case "PIEDMONT":
            here = piedmont
        default:
            here = oakland
        }
        
        return here
    }
}

struct ContentView: View {
    var helper = Helper()
    @State private var selectedCity = ""
    
    @State var region = MKCoordinateRegion(center:Helper().cityMapShouldShow(city: Helper().location), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    

    
    var body: some View {
        NavigationView {
            VStack {
//MARK:- CrimeTracker Icon
                Image("Icon").padding(.bottom)
                
//MARK:- City Selection PickerView
                CrimePickerView(city: $selectedCity)
//MARK:- Get Crimes Button

                NavigationLink(destination: CrimeListView(city: $selectedCity, region: $region)) {
                    
                    Text("Get Crime Results")
                        .font(.title)
                        .padding(.trailing, 40)
                        .padding(.leading, 40)
                        .padding(/*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                }
                .background(Color.gray)
                .foregroundColor(Color.white)
                .cornerRadius(15)
                Button(action: { self.helper.location = selectedCity}, label: {
                    Text("Button")
                
                })
 //MARK:- Lower Image
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
