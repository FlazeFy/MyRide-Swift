//
//  DashboardView.swift
//  MyRide
//
//  Created by Leonardho R Sitanggang on 10/09/25.
//

import SwiftUI

struct DashboardView: View {
    @State private var summary: SummaryResponse? = nil
    @State private var tripDiscovered: FetchTripDiscovered? = nil
    @State private var nextReminder: FetchNextReminder? = nil
    @State private var isLoading = true
    @State private var showError = false

    var body: some View {
        VStack {
            if isLoading {
                ProgressView("Loading Summary...")
            } else {
                if let s = summary {
                    SummaryBox(
                        TotalVehicle: s.totalVehicle,
                        TotalService: s.totalService,
                        TotalClean: s.totalClean,
                        TotalDriver: s.totalDriver,
                        TotalTrip: s.totalTrip
                    )
                }
                if let t = tripDiscovered {
                    TripDiscoveredBox(
                        TotalTrip: t.totalTrip,
                        TotalDistance: t.distanceKM,
                        LastUpdated: t.lastUpdate
                    )
                }
                if let r = nextReminder {
                    NextReminderBox(
                        RemindAt: r.remindAt,
                        ReminderBody: r.reminderBody ?? "-"
                    )
                }
            }
        }
        .onAppear {
            let group = DispatchGroup()
            isLoading = true
            showError = false

            group.enter()
            R_Stats.shared.getSummary { res in
                DispatchQueue.main.async {
                    self.summary = res
                    group.leave()
                }
            }

            group.enter()
            R_Trip.shared.getTripDiscovered { res in
                DispatchQueue.main.async {
                    self.tripDiscovered = res
                    group.leave()
                }
            }
            
            group.enter()
            R_Reminder.shared.getNextReminder { res in
                DispatchQueue.main.async {
                    self.nextReminder = res
                    group.leave()
                }
            }
            
            group.notify(queue: .main) {
                self.isLoading = false
                if summary == nil || tripDiscovered == nil || nextReminder == nil {
                    self.showError = true
                }
            }

        }
        .navigationBarBackButtonHidden(true)
        .alert("Error", isPresented: $showError) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("Failed to get the data")
        }
    }
}

#Preview {
    DashboardView()
}
