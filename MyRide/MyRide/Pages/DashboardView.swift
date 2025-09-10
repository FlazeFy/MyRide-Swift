//
//  DashboardView.swift
//  MyRide
//
//  Created by Leonardho R Sitanggang on 10/09/25.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        SummaryBox(TotalVehicle: 2, TotalService: 2, TotalClean: 2, TotalDriver: 0, TotalTrip: 6)
    }
}

#Preview {
    DashboardView()
}
