//
//  ContentView.swift
//  SwiftUI_CrimeTracker
//
//  Created by Alphonso Sensley II on 6/26/20.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var selectedCity = ""
    @State var region = oakland
    @State var mkReg = MKCoordinateRegion()
    var body: some View {
        NavigationView {
            VStack {
//MARK:- CrimeTracker Icon
                Image("Icon").padding(.bottom)
                
//MARK:- City Selection PickerView
                CrimePickerView(city: $selectedCity)
//MARK:- Get Crimes Button

                NavigationLink(destination: CrimeListView(city: $selectedCity, coordinate: $region, region: $mkReg)) {
                    
                    Text("Get Crime Results")
                        .font(.title)
                        .padding(.trailing, 40)
                        .padding(.leading, 40)
                        .padding(/*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                }
                .background(Color.gray)
                .foregroundColor(Color.white)
                .cornerRadius(15)
    
 //MARK:- Lower Image
                Image("Image").resizable().frame(width: 300, height: 60, alignment: .center) .aspectRatio(contentMode: .fit)
            }.onChange(of: selectedCity) { value in
                region = cityMapShouldShow(city: selectedCity)
                mkReg = MKCoordinateRegion(center: region, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
            }
        }
    }
    
    func cityMapShouldShow(city:String) ->CLLocationCoordinate2D {
        var here = CLLocationCoordinate2D()
        
        switch city {
        case "Oakland":
            here = oakland
        case "Fremont":
            here = fremont
        case "Hayward":
            here = hayward
        case "Berkeley":
            here = berkeley
        case "San Leandro":
            here = sanLeandro
        case "Livermore":
            here = livermore
        case "Pleasanton":
            here = pleasanton
        case "Alameda":
            here = alameda
        case "Union City":
            here = unionCity
        case "Dublin":
            here = dublin
        case "Neward":
            here = newark
        case "Emeryville":
            here = emeryville
        case "Piedmont":
            here = piedmont
        default:
            here = oakland
        }
        
        return here
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
