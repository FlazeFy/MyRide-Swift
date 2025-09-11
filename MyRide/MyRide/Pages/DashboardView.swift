//
//  DashboardView.swift
//  MyRide
//
//  Created by Leonardho R Sitanggang on 10/09/25.
//

import SwiftUI

struct DashboardView: View {
    @State private var summary: SummaryResponse? = nil
    @State private var isLoading = true
    @State private var showError = false

    var body: some View {
        VStack {
            if isLoading {
                ProgressView("Loading Summary...")
            } else if let s = summary {
                SummaryBox(
                    TotalVehicle: s.totalVehicle,
                    TotalService: s.totalService,
                    TotalClean: s.totalClean,
                    TotalDriver: s.totalDriver,
                    TotalTrip: s.totalTrip
                )
                TripDiscoveredBox(
                    TotalTrip: s.totalTrip,
                    TotalDistance: 50.30,
                    LastUpdated: "2025-09-17 14:42:57"
                )
                NextReminderBox(
                    RemindAt: "2025-09-17 14:42:57",
                    ReminderBody: "Lorem Ipsum"
                )
            } else {
                Text("Failed to load summary")
                    .foregroundColor(.red)
            }
        }
        .onAppear {
            R_Stats.shared.getSummary { res in
                DispatchQueue.main.async {
                    if let res = res {
                        self.summary = res
                        self.isLoading = false
                    } else {
                        self.isLoading = false
                        self.showError = true
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .alert("Error", isPresented: $showError) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("Failed to get the summary")
        }
    }
}

#Preview {
    DashboardView()
}
