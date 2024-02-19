import SwiftUI

struct ProfileView: View {
    
    let user: User
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    var body: some View {
            ScrollView {
                // header
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
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    // action button
                    Button(action: {
                        
                    }, label: {
                        Text("Edit Profile")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity, minHeight: 32)
                            .foregroundStyle(.black)
                            .overlay {
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(Color.gray, lineWidth: 1.0)
                            }
                    })
                    Divider()
                }
                .padding()
                //post grid view
                
                LazyVGrid(columns: gridItems, spacing: 1) {
                    ForEach(0 ... 15, id: \.self) { index in
                        Image("thicc")
                            .resizable()
                            .scaledToFill()
                    }
                }
                
                
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

#Preview {
    ProfileView(user: User.MOCK_USER[1])
}
