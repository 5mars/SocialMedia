import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
//    @State private var selectedImage: PhotosPickerItem?
    
    @StateObject var viewModel: EditProfileViewModel
    
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: EditProfileViewModel(user: user))
    }
    
    var body: some View {
        VStack {
            //toolbar
            VStack {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                            .font(.subheadline)
                    }
                    
                    Spacer()
                    
                    Text("Edit Profile")
                        .fontWeight(.semibold)
                        .font(.subheadline)
                        .foregroundStyle(.white)
                    
                    Spacer()
                    
                    Button {
                        Task {
                            try await viewModel.updateUserData()
                            dismiss()
                        }
                    } label: {
                        Text("Done")
                            .fontWeight(.bold)
                            .font(.subheadline)
                    }
                }
                .padding(.horizontal)
                
                Divider()
            }
            
            // edit profile pic
            PhotosPicker(selection: $viewModel.selectedImage) {
                VStack {

                    if let image = viewModel.profileImage {
                        image
                            .resizable()
                            .frame(width: 80, height: 80)
                            .tint(.gray)
                            .clipShape(Circle())
                    } else {
                        CircularProfileImageView(user: viewModel.user, size: .large)
                    }
                    
                    Text("Edit profile picture")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundStyle(.blue)
                    
                    Divider()
                }
            }
            .padding(.vertical, 8)
            // edit profile info
            
            VStack {
                EditProfileRowView(title: "Name", placeholder: "Enter your name", text: $viewModel.fullname)
                EditProfileRowView(title: "Bio", placeholder: "Enter your bio", text: $viewModel.bio)
            }
            
            Spacer()
        }
        .fontDesign(.rounded)
        .background {
            Rectangle()
                .ignoresSafeArea()
                .foregroundStyle(Color("BgColor"))
        }
    }
}

//extension of the view for cleaner code
struct EditProfileRowView: View {
    let title: String
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        HStack {
            Text(title)
                .padding(.leading, 8)
                .frame(width: 100, alignment: .leading)
                .foregroundStyle(.white)
            
            VStack {
                TextField("", text: $text, prompt: Text(placeholder).foregroundStyle(.white.opacity(0.5)))
                    .foregroundStyle(.white)
                
                Divider()
            }
        }
        .fontDesign(.rounded)
        .font(.subheadline)
        .frame(height: 36)
    }
}

#Preview {
    EditProfileView(user: User.MOCK_USER[1])
}
