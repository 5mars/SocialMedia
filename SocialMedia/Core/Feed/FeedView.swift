import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 50) {
                    ForEach(1 ... 10, id: \.self) { post in
                        FeedCell(profileImage: "micleo", username: "_cuckboi69", postImage: "shrek", likeNumber: 69, timeAgo: 5)
                    }
                    .padding(.top, 8)
                }
            }
            .navigationTitle("Feed")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image("abimo")
                        .resizable()
                        .frame(width: 75, height: 26)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }
            }
        }
    }
}

#Preview {
    FeedView()
}
