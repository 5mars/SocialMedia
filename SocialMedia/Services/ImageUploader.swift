import UIKit
import Firebase
import FirebaseStorage

struct ImageUploader {
    static func uploadImage(image: UIImage) async throws -> String? {
        /// Getting the image data from the UIImage and compressing it before uploading it to Firebase
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return nil }
        let fileName = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(fileName)")
        
        do {
            let _ = try await ref.putDataAsync(imageData)
            let url = try await ref.downloadURL()
            return url.absoluteString
        } catch {
            print("Failed to upload image with error: \(error.localizedDescription)")
            return nil
        }
    }

}
