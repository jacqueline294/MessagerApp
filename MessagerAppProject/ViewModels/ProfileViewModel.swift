//
//  ProfileViewModel.swift
//  MessagerAppProject
//
//  Created by jacqueline Ngigi on 2024-11-07.
//

import SwiftUI
import PhotosUI

class ProfileViewModel: ObservableObject {
    @Published var selectedItem: PhotosPickerItem?
    @Published var profileImage: Image?
    
    func loadImage() async throws {
        guard let item = selectedItem else {return}
        do{
            let imageData = try await item.loadTransferable(type: Data.self)
            guard let uiImage = UIImage(data: imageData) else {return}
            self.profileImage = Image(uiImage: uiImage)
        }catch{
            print(" Error loading image \(error.localizedDescription)")
        }
        
    }
}
