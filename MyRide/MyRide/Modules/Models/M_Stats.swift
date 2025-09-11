//
//  M_Stats.swift
//  MyRide
//
//  Created by Leonardho R Sitanggang on 11/09/25.
//

import Foundation

struct SummaryResponse: Codable {
    let totalVehicle: Int
    let totalService: Int
    let totalClean: Int
    let totalDriver: Int
    let totalTrip: Int
    
    enum CodingKeys: String, CodingKey {
        case totalVehicle = "total_vehicle"
        case totalService = "total_service"
        case totalClean = "total_clean"
        case totalDriver = "total_driver"
        case totalTrip = "total_trip"
    }
}
