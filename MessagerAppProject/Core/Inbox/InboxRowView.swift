//
//  InboxRowView.swift
//  MessagerAppProject
//
//  Created by jacqueline Ngigi on 2024-11-07.
//

import SwiftUI

struct InboxRowView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 12){
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 64, height: 64)
                .foregroundColor(Color(.systemGray4))
            
            VStack(alignment: .leading, spacing: 4){
                Text("John Doe")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text("Hello, how are you doing, hope you are fine?")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(2)
                    .frame(maxWidth: UIScreen.main.bounds.width - 100, alignment:.leading)
            }
            HStack{
                Text("Yesterday")
               
                Image(systemName: "chevron.right")
            
            }
            .font(.footnote)
            .foregroundStyle(.gray)
            
        }
        .frame(height:72)
    }
}

#Preview {
    InboxRowView()
}
