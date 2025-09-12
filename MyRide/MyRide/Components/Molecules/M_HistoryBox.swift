//
//  M_HistoryBox.swift
//  MyRide
//
//  Created by Leonardho R Sitanggang on 12/09/25.
//

import Foundation
import SwiftUI

struct HistoryBox: View {
    @State var id: String
    @State var historyType: String
    @State var historyContext: String
    @State var createdAt: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            SummaryText(text: "\(historyType) \(historyContext)", isTitle:true, fontSize: .subheadline)
            SummaryText(text: createdAt, isTitle:false).italic().foregroundColor(.gray)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.black, lineWidth: 1)
        )
    }
}
