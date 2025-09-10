//
//  A_SummaryText.swift
//  MyRide
//
//  Created by Leonardho R Sitanggang on 10/09/25.
//

import Foundation
import SwiftUI

struct SummaryText: View {
    var text: String
    var isTitle: Bool = false
    
    var body: some View {
        if isTitle {
            Text(text)
                .font(.title)
                .fontWeight(.bold)
        } else {
            Text(text)
                .font(.subheadline)
        }
    }
}
