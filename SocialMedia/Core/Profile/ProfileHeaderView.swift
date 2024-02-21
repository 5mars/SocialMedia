import SwiftUI

struct ProfileHeaderView: View {
    let user: User
    
    var body: some View {
        VStack(spacing: 10) {
            // pic and stats
            HStack {
                Image(user.profileImageUrl ?? "")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .shadow(radius: 5)
                
                Spacer()
                
                HStack(spacing: 24) {
                    //post - follower - following
                    UserStatView(value: 10, title: "Posts")
                    
                    UserStatView(value: 69, title: "Followers")

                    UserStatView(value: 69, title: "Following")
                }
            }
            
            // name and bio
            VStack(alignment: .leading, spacing: 4) {
                if let fullName = user.fullName {
                    Text(fullName)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                
                if let bio = user.bio {
                    Text(bio)
                        .font(.footnote)
                }
                Text(user.username) //testing purposes!!
            }
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            // action button
            Button(action: {
                if user.isCurrentUser {
                    print("Show edit profile")
                } else {
                    print("Follow user")
                }
            }, label: {
                Text(user.isCurrentUser ? "Edit Profile" : "Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, minHeight: 32)
                    .background(user.isCurrentUser ? Color("BgColor") : .blue)
                    .foregroundStyle(user.isCurrentUser ? Color("textColor") : .white)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                    .overlay {
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(user.isCurrentUser ? Color.gray : Color.clear, lineWidth: 1.0)
                    }
            })
            Divider()
        }
        .padding()
    }
}

#Preview {
    ProfileHeaderView(user: User.MOCK_USER[1])
        .background {
            Rectangle()
                .ignoresSafeArea()
                .foregroundStyle(Color("BgColor"))
        }
}
