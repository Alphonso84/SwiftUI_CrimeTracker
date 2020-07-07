//
//  CrimeData.swift
//  SwiftUI_CrimeTracker
//
//  Created by Alphonso Sensley II on 7/2/20.
//

import Foundation


// MARK: - Welcome
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

// MARK: - Feature
struct Feature: Codable, Hashable, Identifiable {
    
    let attributes: Attributes
    let geometry: Geometry
    var id: UUID?
    
    enum CodingKeys: String, CodingKey {
        case attributes = "attributes"
        case geometry = "geometry"
    }
    
}

// MARK: - Attributes
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
}

// MARK: - Field
struct Field: Codable {
    let name, type, alias, sqlType: String
    let length: Int?
    let domain, defaultValue: JSONNull?
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

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public func hash(into hasher: inout Hasher) {
        // No-op
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}



