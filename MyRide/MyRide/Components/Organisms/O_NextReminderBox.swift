//
//  O_NextReminderBox.swift
//  MyRide
//
//  Created by Leonardho R Sitanggang on 10/09/25.
//

import Foundation
import SwiftUI

struct NextReminderBox: View {
    var RemindAt: String
    var ReminderBody: String
    
    private var formattedDate: String
    private var formattedHour: String
    
    init(RemindAt: String, ReminderBody: String) {
        self.RemindAt = RemindAt
        self.ReminderBody = ReminderBody
        
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        inputFormatter.locale = Locale(identifier: "en_US_POSIX")
        
        if let remindDate = inputFormatter.date(from: RemindAt) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd MMM yyyy"
            self.formattedDate = dateFormatter.string(from: remindDate)
            
            let hourFormatter = DateFormatter()
            hourFormatter.dateFormat = "hh:mm a"
            self.formattedHour = hourFormatter.string(from: remindDate)
        } else {
            self.formattedDate = "-"
            self.formattedHour = "-"
        }
    }
    
    var body: some View {
        VStack(spacing: 10) {
            Heading(text: "Next Reminder")
            SummaryText(text: formattedDate, isTitle: true)
            HStack {
                SummaryText(text: formattedHour, isTitle: false).fontWeight(.semibold)
            }
            .padding(6)
            .background(Color(.green))
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.black, lineWidth: 1)
            )
            HStack {
                SummaryText(text: "Notes:", isTitle: false).fontWeight(.semibold)
                SummaryText(text: ReminderBody, isTitle: false)
            }.italic()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(.systemGray6))
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.black, lineWidth: 1)
        )
        .padding(.horizontal, 16)
        .padding(.bottom, 16)
    }
}
