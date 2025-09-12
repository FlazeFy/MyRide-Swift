//
//  M_History.swift
//  MyRide
//
//  Created by Leonardho R Sitanggang on 12/09/25.
//

import Foundation

struct FetchAllHistory: Codable {
    let id: String
    let historyType: String
    let historyContext: String
    let createdAt: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case historyType = "history_type"
        case historyContext = "history_context"
        case createdAt = "created_at"
    }
}
