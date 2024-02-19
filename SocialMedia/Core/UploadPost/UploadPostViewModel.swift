import Foundation
import PhotosUI
import SwiftUI

@MainActor
//view model in charge of displaying into the view the photo you selected
class UploadPostViewModel: ObservableObject {
    
    //@published notify our view that something changes
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task{
                await loadImage(fromItem: selectedImage)
            }
        }
    }
    
    @Published var postImage: Image?
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else {
            return
        }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else {
            return
        }
        guard let uiImage = UIImage(data: data) else { return }
        self.postImage = Image(uiImage: uiImage)
        
    }
}
