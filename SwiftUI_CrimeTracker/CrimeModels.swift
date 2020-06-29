//
//  CrimeModels.swift
//  SwiftUI_CrimeTracker
//
//  Created by Alphonso Sensley II on 6/29/20.
//

import Foundation

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
