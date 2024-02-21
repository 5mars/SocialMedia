import SwiftUI

struct FeedCell: View {
    let post: Post
    
    var body: some View {
        VStack {
            // profile img + username
            HStack {
                if let user = post.user {
                    Image(user.profileImageUrl ?? "")
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 40, height: 40)
                        .shadow(radius: 5)
                    
                    Text(user.username)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                
                Spacer()
            }
            .padding(.leading, 10)
            
            //profile img
            Image(post.imageUrl)
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .clipShape(Rectangle())
            
            VStack(spacing: 8) {
                HStack(spacing: 16) {
                    Button {
                        print("Like post")
                    } label: {
                        Image(systemName: "heart")
                            .imageScale(.large)
                    }
                    
                    Button {
                        print("Comment post")
                    } label: {
                        Image(systemName: "bubble.right")
                            .imageScale(.large)
                    }
                    
                    Button {
                        print("Share post")
                    } label: {
                        Image(systemName: "paperplane")
                            .imageScale(.large)
                    }
                    
                    Spacer()
                    
                }
                .padding(.top, 4)
                .foregroundStyle(Color("textColor"))
                
                //likes label
                Text("\(post.likes) likes")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                //caption label
                HStack {
                    Text("\(post.user?.username ?? "") ").fontWeight(.semibold) +
                    Text(post.caption)
                }
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("\(post.timestamp)h ago")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            .padding(.leading, 10)
            //action buttons
        }
    }
}

#Preview {
    FeedCell(post: Post.MOCK_POSTS[1])
        .background {
            Rectangle()
                .ignoresSafeArea()
                .foregroundStyle(Color("BgColor"))
        }
}
