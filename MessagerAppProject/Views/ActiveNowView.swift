//
//  ActiveNowView.swift
//  MessagerAppProject
//
//  Created by jacqueline Ngigi on 2024-11-07.
//

import SwiftUI


struct ActiveNowView: View {
    
    @StateObject private var viewModel = ActiveNowViewModel()
    
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false){
            HStack(spacing:32){
                 
                ForEach(viewModel.activeUsers,id:\.id){user in
                    VStack{
                        ZStack(alignment:.bottomTrailing){
                            CircularProfileImageView(user: User.MOCK_USER, size: .medium)
                            
                            ZStack{
                                Circle()
                                    .fill(.white)
                                    .frame(width:18, height: 18)
                                
                                Circle()
                                    .fill(Color(.systemGreen))
                                    .frame(width:12, height: 12)
                                    
                                    
                            }
                                
                            
                        }
                        Text(user.fullname)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                    }
                }
                
            }
            .padding()
        }
        .frame(height:106)
    }
}

#Preview {
    ActiveNowView()
}
