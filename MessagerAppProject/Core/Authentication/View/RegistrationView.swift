//
//  RegistrationView.swift
//  MessagerAppProject
//
//  Created by jacqueline Ngigi on 2024-11-07.
//

import SwiftUI

struct RegistrationView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var name: String = ""
    @Environment(\.dismiss) var dismiss
    
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
                TextField("Enter your Name", text: $name)
                    .font(.subheadline)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal,24)
                
                
                TextField("Enter your Email", text: $email)
                    .font(.subheadline)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal,24)
                
                SecureField("Enter your Password", text: $password)
                    .font(.subheadline)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal,24)
                
            }
            
            Button{
                print( "handle login")
            }label: {
                Text("Sign Up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width:360, height:44)
                    .background(Color(.systemBlue))
            }
            .padding()
            
            Spacer()
            
            Divider()
            
            Button{
                dismiss()
            }label: {
                Text( "Already have an account?")
                
                Text("Login")
                    .fontWeight(.semibold)
            }
            .font(.footnote)
        }
        .padding(.vertical)
    }
}

#Preview {
    RegistrationView()
}
