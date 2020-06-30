//
//  CrimeModels.swift
//  SwiftUI_CrimeTracker
//
//  Created by Alphonso Sensley II on 6/29/20.
//
import MapKit
import Foundation



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
