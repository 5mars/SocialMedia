import SwiftUI

struct ProfileView: View {
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                // header
                VStack(spacing: 10) {
                    // pic and stats
                    HStack {
                        Image("restarted")
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
                        Text("Jeremy Cinq-Mars")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        Text("This is my bio")
                            .font(.footnote)
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
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundStyle(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
