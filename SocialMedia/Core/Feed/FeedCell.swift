import SwiftUI

struct FeedCell: View {
    var profileImage: String
    var username: String
    var postImage: String
    var likeNumber: Int
    var timeAgo: Int
    
    var body: some View {
        VStack {
            // profile img + username
            HStack {
                Image("\(profileImage)")
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 40, height: 40)
                
                Text("\(username)")
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Spacer()
            }
            .padding(.leading, 10)
            
            //profile img
            Image("\(postImage)")
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
                .foregroundStyle(.black)
                
                //likes label
                Text("\(likeNumber) likes")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                //caption label
                HStack {
                    Text("\(username) ").fontWeight(.semibold) +
                    Text("This is a caption for this post")
                }
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("\(timeAgo)h ago")
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
    FeedCell(profileImage: "micleo", username: "_cuckboi69", postImage: "shrek", likeNumber: 69, timeAgo: 5)
}
