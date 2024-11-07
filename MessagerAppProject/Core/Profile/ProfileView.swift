//
//  ProfileView.swift
//  MessagerAppProject
//
//  Created by jacqueline Ngigi on 2024-11-07.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    let user: User
    
    var body: some View {
        VStack{
            //Header
            VStack{
                PhotosPicker(selection: $viewModel.selectedItem) {
                    if let profileImage = viewModel.profileImage{
                        profileImage
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                    }else {
                        Image(user.profileImageUrl ?? "")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                    }
                    
                }
                Text(user.fullname)
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            
            List{
                Section{
                    ForEach(SettingOptionsViewModel.allCases){ option in
                        HStack{
                            Image(systemName: option.imageName)
                                .resizable()
                                .frame(width:24,height: 24)
                                .foregroundColor(option.imageBackgroundColor)
                            
                            Text(option.title)
                                .font(.subheadline)
                                  
                        }
                    }
                }
                Section{
                    Button ("Logout"){
                        
                    }
                    
                    Button ("Delet Account"){
                        
                        }
                    }
                    .foregroundColor(.red)
                }
            }
        }
    }

#Preview {
    ProfileView( user: User.MOCK_USER)
}
