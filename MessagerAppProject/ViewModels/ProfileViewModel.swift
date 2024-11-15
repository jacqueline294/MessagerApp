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
    
    func loadImage() async {
            guard let item = selectedItem else { return }
            
            do {
                // Safely unwrap `imageData` using `guard let`
                guard let imageData = try await item.loadTransferable(type: Data.self) else {
                    print("No data found.")
                    return
                }
                
                // Safely create a UIImage from the data
                guard let uiImage = UIImage(data: imageData) else {
                    print("Failed to create UIImage.")
                    return
                }
                
                // Convert UIImage to SwiftUI Image
                self.profileImage = Image(uiImage: uiImage)
                
            } catch {
                print("Error loading image: \(error.localizedDescription)")
            }
        }
    }

