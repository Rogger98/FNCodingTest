//
//  VehicleModle.swift
//  FNCodingTest
//
//  Created by psagc on 22/03/22.
//

import Foundation


struct Location {
    var lat : Double
    var lon: Double
}

struct POIResponse: Codable {
    let poiList: [PoiList]?
}

// MARK: - PoiList
struct PoiList: Codable {
    let id: Generic?
    let coordinate: Coordinate?
    let state, type: Generic?
    let heading: Generic?
}

// MARK: - Coordinate
struct Coordinate: Codable {
    let latitude, longitude: Generic?
}
