//
//  O_TripDiscoveredBox.swift
//  MyRide
//
//  Created by Leonardho R Sitanggang on 10/09/25.
//

import Foundation
import SwiftUI

struct TripDiscoveredBox: View {
    var TotalTrip: Int
    var TotalDistance: Float
    var LastUpdated: String
    
    var body: some View {
        VStack(spacing: 10) {
            Heading(text: "Trip Discovered")
            SummaryText(text: "\(TotalTrip) Trip", isTitle: true)
            HStack {
                SummaryText(text: "\(TotalDistance) Km", isTitle: false).fontWeight(.semibold)
            }
            .padding(6)
            .background(Color(.green))
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.black, lineWidth: 1)
            )
            HStack {
                SummaryText(text: "Last Updated", isTitle: false).fontWeight(.semibold)
                SummaryText(text: LastUpdated, isTitle: false)
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
