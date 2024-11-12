//
//  CircularProfileImageView.swift
//  MessagerAppProject
//
//  Created by jacqueline Ngigi on 2024-11-08.
//

import SwiftUI

// to build a reuseable profile image thus making it easy to impliment it on other views .

enum ProfileImageSize{
    case xxSmall
    case xSmall
    case small
    case medium
    case large
    case xlarge
    
    var dimension: CGFloat{
        switch self {
        case .xxSmall: return 28
        case .xSmall: return 32
        case .small: return 40
        case .medium: return 56
        case .large: return 64
        case .xlarge: return 80
        }
    }
    
}

struct CircularProfileImageView: View {
    var user: User?
    let size: ProfileImageSize
    
    var body: some View{
        if  let imageUrl = user?.profileImageUrl {
            Image(imageUrl)
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
        }else {
            Image(systemName: "")
                .resizable()
                .frame(width:size.dimension, height: size.dimension)
                .foregroundColor(Color(.systemGray4))
               
            
        }
        }
    }



#Preview {
    CircularProfileImageView(user: User.MOCK_USER,size: .medium)
}
