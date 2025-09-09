//
//  A_Button.swift
//  MyRide
//
//  Created by Leonardho R Sitanggang on 09/09/25.
//

import Foundation
import SwiftUI

struct PrimaryButton: View {
    var label: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: "arrow.right")
                Text(label)
                    .fontWeight(.semibold)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(12)
            .shadow(radius: 4)
        }
    }
}
