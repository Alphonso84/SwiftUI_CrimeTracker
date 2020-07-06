//
//  Constants.swift
//  SwiftUI_CrimeTracker
//
//  Created by Alphonso Sensley II on 7/1/20.
//

import Foundation
import MapKit



// PASS IN DIFFERENT CITY TO GET CRIMES FOR SPECIFIC CITY https://services5.arcgis.com/ROBnTHSNjoZ2Wm1P/arcgis/rest/services/Crime_Reports/FeatureServer/0/query?where=City%20%3D%20%27ALAMEDA%27&outFields=City,Block,Zip,CrimeDescription,Longitude,Latitude,DateTime&outSR=4326&f=json

/* ADD URL HEADER HERE https://services5.arcgis.com/ROBnTHSNjoZ2Wm1P/arcgis/rest/services/Crime_Reports/FeatureServer/0/query?where=1%3D1&outFields=Block,Street,City,State,Zip,CrimeDescription,Longitude,Latitude,DateTime&outSR=4326&f=json
*/



let oakland = CLLocationCoordinate2D(latitude: 37.8044, longitude: -122.2712)
let fremont = CLLocationCoordinate2D(latitude: 37.5485, longitude: -121.9886)
let hayward = CLLocationCoordinate2D(latitude: 37.6688, longitude: -122.0810)
let berkeley = CLLocationCoordinate2D(latitude: 37.8715, longitude: -122.2730)
let sanLeandro = CLLocationCoordinate2D(latitude: 37.7258, longitude: -122.159)
let livermore = CLLocationCoordinate2D(latitude: 37.6819, longitude: -121.7685)
let pleasanton = CLLocationCoordinate2D(latitude: 37.6604, longitude: -121.8758)
let alameda = CLLocationCoordinate2D(latitude: 37.7799, longitude: -122.2822)
let unionCity = CLLocationCoordinate2D(latitude: 37.5934, longitude: -122.0439)
let dublin = CLLocationCoordinate2D(latitude: 37.7159, longitude: -121.9101)
let newark = CLLocationCoordinate2D(latitude: 37.5300, longitude: -122.0384)
let emeryville = CLLocationCoordinate2D(latitude: 37.8395, longitude: -122.2892)
let piedmont = CLLocationCoordinate2D(latitude: 37.8244, longitude: -122.2315)

/*
 ENUM IS USED BY CRIMEPICKERVIEW TO POPULATE LIST OF CITIES
 */
enum Cities: String, CaseIterable, Identifiable, Codable {
    case OAKLAND
    case FREMONT
    case HAYWARD
    case BERKELEY
    case SANLEANDRO = "SAN LEANDRO"
    case LIVERMORE
    case PLEASANTON
    case ALAMEDA
    case UNIONCITY = "UNION CITY"
    case DUBLIN
    case NEWARK
    case EMERYVILLE
    case PIEDMONT
    
    var id: String {self.rawValue}
    
}
