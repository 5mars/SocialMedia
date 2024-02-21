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
        
        /// So that the text for the full name is already there whenever you click on edit profile
        if let fullname = user.fullname {
            self.fullname = fullname
        }
        /// Same thing but for the bio text
        if let bio = user.bio {
            self.bio = bio
        }
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
            print("update user data kicks in : Image changed")
        }
        // update full name if change
        if !fullname.isEmpty && user.fullname != fullname {
            user.fullname = fullname
            data["fullname"] = fullname
            print("update user data kicks in : name changed")
        }
        // update bio if change
        if !bio.isEmpty && user.bio != bio {
            user.bio = bio
            data["bio"] = bio
            print("update user data kicks in : bio changed")
        }
        
        if !data.isEmpty {
            try await Firestore.firestore().collection("users").document(user.id).updateData(data)
        }
    }

}
