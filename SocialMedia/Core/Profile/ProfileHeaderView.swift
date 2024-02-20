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
            .frame(maxWidth: .infinity, alignment: .leading)
            
            // action button
            Button(action: {
                
            }, label: {
                Text("Edit Profile")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, minHeight: 32)
                    .foregroundStyle(Color("textColor"))
                    .overlay {
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.gray, lineWidth: 1.0)
                    }
            })
            Divider()
        }
        .padding()
    }
}

#Preview {
    ProfileHeaderView(user: User.MOCK_USER[1])
}
