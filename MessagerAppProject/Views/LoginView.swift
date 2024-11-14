//
//  LoginView.swift
//  MessagerAppProject
//
//  Created by jacqueline Ngigi on 2024-11-06.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        
            VStack{
                Text("Welcome to Chat Link")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding()
                
            }
            VStack{
                //logo
            Image("Chat Link")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .padding()
                //textField
                VStack{
                    
                    TextField("Enter your Email", text: $viewModel.email)
                        .font(.subheadline)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal,24)
                    
                    SecureField("Enter your Password", text: $viewModel.password)
                        .font(.subheadline)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal,24)
                        
                }
                
                // forgot password
                Button{
                    print("Forgot Password")
                }label: {
                    Text("Forgot Password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing,20)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                
                // login button
                Button{
                    Task{ try await viewModel.login()}
                }label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width:360, height:44)
                        .background(Color(.systemBlue))
                }
                .padding()
                
                HStack{
                    Rectangle()
                        .frame(width:(UIScreen.main.bounds.width / 2)-40, height: 0.5)
                    
                    Text("OR")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Rectangle()
                        .frame(width:(UIScreen.main.bounds.width / 2)-40, height: 0.5)
                    
                    
                }
                .padding()
                
                
                //Signup link
                NavigationLink{
                    RegistrationView()
                } label: {
                    HStack(spacing:3){
                        Text("Sign up")
                        
                    
                    }
                    .padding()
                }
                
            }
    }
}

#Preview {
    LoginView()
}
