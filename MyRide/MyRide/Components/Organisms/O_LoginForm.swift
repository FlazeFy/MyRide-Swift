//
//  O_LoginForm.swift
//  MyRide
//
//  Created by Leonardho R Sitanggang on 09/09/25.
//

import Foundation
import SwiftUI

struct LoginForm: View {
    @Binding var username: String
    @Binding var password: String
    @State private var errorMessage: String? = nil
    @State private var isLoading = false
    @State private var isLoggedIn = false
    
    var body: some View {
        VStack(spacing: 16) {
            EmailField(username: $username)
            PasswordField(password: $password)
            
            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .font(.caption)
            }
            
            PrimaryButton(label: isLoading ? "Loading..." : "Enter the Garage") {
                login()
            }
            .disabled(isLoading)
            
            .navigationDestination(isPresented: $isLoggedIn) {
                DashboardView()
            }
        }
    }
    
    private func login() {
        errorMessage = nil
        isLoading = true
        
        AuthRepository.shared.login(username: username, password: password) { result in
            DispatchQueue.main.async {
                isLoading = false
                switch result {
                case .success(let response):
                    if !response.token.isEmpty {
                        isLoggedIn = true
                    } else {
                        errorMessage = "Something went wrong"
                    }
                case .failure(let error):
                    errorMessage = error.localizedDescription
                }
            }
        }
    }
}
