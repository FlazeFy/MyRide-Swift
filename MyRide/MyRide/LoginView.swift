//
//  LoginView.swift
//  MyRide
//
//  Created by Leonardho R Sitanggang on 09/09/25.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack {
            Color(hex: "#FFC352")
                    .ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 20) {
                VStack(alignment: .center, spacing: 8) {
                    Text("You are at MyRide Apps")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                    
                    Text("Management Apps for your vehicle")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.bottom, 20)
                
                LoginForm(email: $email, password: $password)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 6)
            .padding(.horizontal, 24)
        }
    }
}

#Preview {
    LoginView()
}
