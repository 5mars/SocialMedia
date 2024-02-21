import UIKit
import Firebase
import FirebaseStorage

///The code is a Swift struct for uploading images to Firebase Storage.
/// 1.    The ﻿uploadImage function takes a UIImage, compresses it, and uploads it to Firebase Storage.
/// 2.    Image data is obtained from the UIImage and compressed with a quality of 0.5.
/// 3.    A unique filename is generated using NSUUID.
/// 4.    A reference to the Firebase Storage path is created.
/// 5.    The image data is uploaded asynchronously to Firebase Storage.
/// 6.    The download URL of the uploaded image is retrieved and returned as a string.
/// 7.    If any errors occur during the upload process, an error message is printed, and nil is returned.


struct ImageUploader {
    static func uploadImage(image: UIImage) async throws -> String? {
        /// Getting the image data from the UIImage and compressing it before uploading it to Firebase
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return nil }
        let fileName = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(fileName)") /// Creates a reference pointing to the upload location in Firebase Storage using
        
        do {
            let _ = try await ref.putDataAsync(imageData) /// Uses a let _ to discard the result of the upload operation explicitly, but not recommended in most cases.
            let url = try await ref.downloadURL()
            return url.absoluteString
        } catch {
            print("Failed to upload image with error: \(error.localizedDescription)")
            return nil
        }
    }

}
