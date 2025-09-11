//
//  M_Reminder.swift
//  MyRide
//
//  Created by Leonardho R Sitanggang on 11/09/25.
//

import Foundation

struct FetchNextReminder: Codable {
    let reminderTitle: String
    let reminderContext: String
    let reminderBody: String?
    let remindAt: String
    let vehiclePlateNumber: String?
    
    enum CodingKeys: String, CodingKey {
        case reminderTitle = "reminder_title"
        case reminderContext = "reminder_context"
        case reminderBody = "reminder_body"
        case remindAt = "remind_at"
        case vehiclePlateNumber = "vehicle_plate_number"
    }
}
