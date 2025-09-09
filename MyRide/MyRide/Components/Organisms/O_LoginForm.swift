//
//  O_LoginForm.swift
//  MyRide
//
//  Created by Leonardho R Sitanggang on 09/09/25.
//

import Foundation
import SwiftUI

struct LoginForm: View {
    @Binding var email: String
    @Binding var password: String
    
    var body: some View {
        VStack(spacing: 16) {
            EmailField(email: $email)
            PasswordField(password: $password)
            
            PrimaryButton(label: "Enter the Garage") {
                // ...
            }
        }
    }
}
