//
//  M_EmailField.swift
//  MyRide
//
//  Created by Leonardho R Sitanggang on 09/09/25.
//

import Foundation
import SwiftUI

struct EmailField: View {
    @Binding var username: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            TextInputField(
                title: "Email address / Username",
                placeholder: "ex : jhondoe@gmail.com",
                text: $username
            )
            
            Text("We'll never share your email with anyone else")
                .font(.caption)
                .foregroundColor(.gray)
        }
    }
}
