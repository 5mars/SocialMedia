import SwiftUI
import PhotosUI

struct UploadPostView: View {
    @State private var caption = ""
    @State private var imagePickerPresented = false
    @StateObject var viewModel = UploadPostViewModel()
    @Binding var tabIndex: Int
    @FocusState var isFocused: Bool
    
    var body: some View {
        VStack {
            //action tool bar
            HStack {
                Button {
                    clearPostDataAndReturnToFeed()
                } label: {
                    Text("Cancel")
                }
                
                Spacer()
                
                Text("New Post")
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button {
                    Task {
                        try await viewModel.uploadPost(caption: caption)
                        clearPostDataAndReturnToFeed() /// Call function that clear data out and return user to the feed view
                    }
                } label: {
                    Text("Upload")
                        .fontWeight(.semibold)
                        .foregroundStyle(.blue)
                }
            }
            .padding(.horizontal)
            .foregroundStyle(Color("textColor"))
            
            // post image and caption
            HStack(spacing: 8) {
                if let image = viewModel.postImage {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .shadow(radius: 10)
                }
                
                TextField("Enter your caption...", text: $caption, axis: .vertical)
                    .focused($isFocused)
                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            HStack {
                                Spacer()
                                
                                Button {
                                    isFocused = false
                                } label: {
                                    Text("Done")
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.blue)
                                }
                            }
                        }
                    }
            }
            .padding()
            
            Spacer()
        }
        .background {
            Rectangle()
                .ignoresSafeArea()
                .foregroundStyle(Color("BgColor"))
        }
        .onAppear {
            imagePickerPresented.toggle()
        }
        .photosPicker(isPresented: $imagePickerPresented, selection: $viewModel.selectedImage)
    }
    
    func clearPostDataAndReturnToFeed() {
        caption = ""
        viewModel.selectedImage = nil
        viewModel.postImage = nil
        tabIndex = 0 //go back to the home tab
    }
}

#Preview {
    UploadPostView(tabIndex: .constant(0))
}
