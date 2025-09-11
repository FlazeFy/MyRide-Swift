//
//  M_Trip.swift
//  MyRide
//
//  Created by Leonardho R Sitanggang on 11/09/25.
//

import Foundation

struct FetchTripDiscovered: Codable {
    let totalTrip: Int
    let distanceKM: String
    let lastUpdate: String
    
    enum CodingKeys: String, CodingKey {
        case totalTrip = "total_trip"
        case distanceKM = "distance_km"
        case lastUpdate = "last_update"
    }
}
