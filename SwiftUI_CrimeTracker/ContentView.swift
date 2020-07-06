//
//  ContentView.swift
//  SwiftUI_CrimeTracker
//
//  Created by Alphonso Sensley II on 6/26/20.
//

import SwiftUI
import MapKit

struct Response: Codable {
    var results: [Attributes]

}

struct ContentView: View {
    @State var results = [Feature]()
    @State private var selectedCity = "OAKLAND"
    @State var location = oakland
    @State var region = MKCoordinateRegion()
    var body: some View {
        NavigationView {
            VStack {
//MARK: - CrimeTracker Icon
                Image("Icon").padding(.bottom)
                
//MARK: - City Selection PickerView
                CrimePickerView(city: $selectedCity)
                    
//MARK: - Get Crimes Button

                NavigationLink(destination: CrimeListMapView(city: $selectedCity, coordinate: $location, region: $region, crimes: $results)) {
                    
                    Text("Get Crime Results")
                        .font(.title)
                        .padding(.trailing, 40)
                        .padding(.leading, 40)
                        .padding(/*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                }
                .background(Color.gray)
                .foregroundColor(Color.white)
                .cornerRadius(15)
    
//MARK: - Lower Image
                Image("Image").resizable().frame(width: 300, height: 60, alignment: .center) .aspectRatio(contentMode: .fit)
              //The onChange modifier is used to monitor changes of the selectedCity @State variable and take actions whenever it is changed.
            }.onChange(of: selectedCity) { value in
                location = cityMapShouldShow(city: selectedCity)
                region = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.2))
                loadData(city: selectedCity)
            }
        }
    }
    
    func loadData(city:String) {
        let cityURL:String = city.replacingOccurrences(of: " ", with: "%20")
        let urlString = "https://services5.arcgis.com/ROBnTHSNjoZ2Wm1P/arcgis/rest/services/Crime_Reports/FeatureServer/0/query?where=City%20%3D%20%27\(cityURL)%27&outFields=City,Block,Zip,CrimeDescription,Longitude,Latitude,DateTime&outSR=4326&f=json"
        
        guard let url = URL(string: urlString) else {
            print(urlString)
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        
        let session = URLSession.shared
        let task = session.dataTask(with: (request)) { (data, response, error) in
            print("Start")
            print(urlString)
            guard let unwrappedData = data else {return}
            do {
                
                let jsonDecoder = JSONDecoder()
                let jsonData = try jsonDecoder.decode(Welcome.self, from: unwrappedData)
                //USE SERILIZATION BELOW IF DECODER DOESNT WORK
                //if let jsonData = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as? [String: Any] {
              
                //let feature = jsonData["features"] as? [[String: Any]]
                results = jsonData.features
               
                print(results)
        
             //   }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
        
    
//MARK: - Method used to return a CLLocationCoordinate based on selectedCity variable.
    func cityMapShouldShow(city:String) ->CLLocationCoordinate2D {
        var here = CLLocationCoordinate2D()
        
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
