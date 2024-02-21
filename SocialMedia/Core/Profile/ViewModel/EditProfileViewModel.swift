import PhotosUI
import SwiftUI
import Firebase

@MainActor
class EditProfileViewModel: ObservableObject {
    //@published notify our view that something changes
    @Published var user: User
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task{
                await loadImage(fromItem: selectedImage)
            }
        }
    }
    @Published var profileImage: Image?
    @Published var fullname = ""
    @Published var bio = ""
    
    private var uiImage: UIImage?
    
    init(user: User) {
        self.user = user
    }
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else {
            return
        }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else {
            return
        }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }
    
    func updateUserData() async throws {
        
        var data = [String: Any]() //Create a dictionary
        
        // update profile image if change
        if let uiImage = uiImage {
            let imageUrl = try? await ImageUploader.uploadImage(image: uiImage)
            data["profileImageUrl"] = imageUrl
        }
        // update full name if change
        if !fullname.isEmpty && user.fullname != fullname {
            user.fullname = fullname
            data["fullname"] = fullname
        }
        // update bio if change
        if !bio.isEmpty && user.bio != bio {
            user.bio = bio
            data["bio"] = bio
        }
        
        if !data.isEmpty {
            try await Firestore.firestore().collection("users").document(user.id).updateData(data)
        }
    }

}
