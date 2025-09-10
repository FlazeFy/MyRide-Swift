//
//  O_Summary.swift
//  MyRide
//
//  Created by Leonardho R Sitanggang on 10/09/25.
//

import Foundation
import SwiftUI

struct SummaryBox: View {
    var TotalVehicle: Int
    var TotalService: Int
    var TotalClean: Int
    var TotalDriver: Int
    var TotalTrip: Int
    
    var body: some View {
        VStack(spacing: 16) {
            Heading(text: "Summary")
            HStack(spacing: 40) {
                VStack {
                    SummaryText(text: "\(TotalVehicle)", isTitle: true)
                    SummaryText(text: "Vehicle", isTitle: false)
                }
                VStack {
                    SummaryText(text: "\(TotalService)", isTitle: true)
                    SummaryText(text: "Service", isTitle: false)
                }
                VStack {
                    SummaryText(text: "\(TotalClean)", isTitle: true)
                    SummaryText(text: "Clean", isTitle: false)
                }
            }
            HStack(spacing: 40) {
                VStack {
                    SummaryText(text: "\(TotalDriver)", isTitle: true)
                    SummaryText(text: "Driver", isTitle: false)
                }
                VStack {
                    SummaryText(text: "\(TotalTrip)", isTitle: true)
                    SummaryText(text: "Trip", isTitle: false)
                }
            }
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
