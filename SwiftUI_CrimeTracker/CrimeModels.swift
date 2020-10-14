//
//  CrimeData.swift
//  SwiftUI_CrimeTracker
//
//  Created by Alphonso Sensley II on 7/2/20.
//

import Foundation


// MARK: - Welcome Object
struct Welcome: Codable {
    let objectIDFieldName: String
    let uniqueIDField: UniqueIDField
    let globalIDFieldName, geometryType: String
    let spatialReference: SpatialReference
    let fields: [Field]
    let features: [Feature]

    enum CodingKeys: String, CodingKey {
        case objectIDFieldName = "objectIdFieldName"
        case uniqueIDField = "uniqueIdField"
        case globalIDFieldName = "globalIdFieldName"
        case geometryType, spatialReference, fields, features
    }
}

// MARK: - Feature Object
struct Feature: Codable, Hashable, Identifiable {
    let attributes: Attributes
    let geometry: Geometry
    var id: UUID?
    
    enum CodingKeys: String, CodingKey {
        case attributes = "attributes"
        case geometry = "geometry"
    }
}

// MARK: - Attributes Object
struct Attributes: Codable, Hashable {
    let city: City?
    let block: String?
    let zip: String?
    let crimeDescription: String?
    let longitude: Double?
    let latitude: Double?
    let dateTime: Date?
    
    enum CodingKeys: String, CodingKey {
        case city = "City"
        case block = "Block"
        case zip = "Zip"
        case crimeDescription = "CrimeDescription"
        case longitude = "Longitude"
        case latitude = "Latitude"
        case dateTime = "DateTime"
        
    }
}

enum City: String, Codable {
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
}

// MARK: - Geometry
struct Geometry: Codable, Hashable {
    let x, y: Double
    
    enum CodingKeys: String, CodingKey {
        case x = "x"
        case y = "y"
    }
}

// MARK: - Field
struct Field: Codable {
    let name, type, alias, sqlType: String
    let length: Int?
    let domain, defaultValue: String?
}

// MARK: - SpatialReference
struct SpatialReference: Codable {
    let wkid, latestWkid: Int
}

// MARK: - UniqueIDField
struct UniqueIDField: Codable {
    let name: String
    let isSystemMaintained: Bool
}

