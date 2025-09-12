//
//  O_HistoryList.swift
//  MyRide
//
//  Created by Leonardho R Sitanggang on 12/09/25.
//

import Foundation
import SwiftUI

struct HistoryList: View {
    var histories: [FetchAllHistory]
    
    var body: some View {
        VStack(spacing: 10) {
            Heading(text: "All History")
            ForEach(histories, id: \.id) { dt in
                HistoryBox(id: dt.id, historyType: dt.historyType, historyContext: dt.historyContext, createdAt: dt.createdAt)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.black, lineWidth: 1)
        )
        .padding(.horizontal, 16)
        .padding(.bottom, 16)
    }
}
