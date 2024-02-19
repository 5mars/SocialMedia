import SwiftUI

struct ProfileView: View {
    
    let user: User
    var posts: [Post] {
        return Post.MOCK_POSTS.filter({ $0.user?.username == user.username })
    }
    
    
    var body: some View {
            ScrollView {
                // header
                ProfileHeaderView(user: user)
                
                //post grid view
                PostGridView(posts: posts)
                
                
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

#Preview {
    ProfileView(user: User.MOCK_USER[1])
}
