import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @StateObject var viewModel = SearchViewModel()
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(viewModel.users) { user in
                        NavigationLink(value: user) {
                            HStack() {
                                Image(systemName: "person.circle")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundStyle(.gray)
                                    .scaledToFill()
                                    .clipShape(Circle())
                                
                                VStack(alignment: .leading) {
                                    Text(user.username)
                                        .fontWeight(.semibold)
                                    
                                    if let fullname = user.fullname {
                                        Text(fullname)
                                    }
                                }
                                .font(.footnote)
                                
                                Spacer()
                            }
                            .foregroundStyle(Color("textColor"))
                            .padding(.horizontal)
                        }
                    }
                }
                .navigationDestination(for: User.self, destination: { user in
                    ProfileView(user: user)
                })
                .padding(.top, 8)
                .searchable(text: $searchText, prompt: "Search...")
            }
            .background {
                Rectangle()
                    .ignoresSafeArea()
                    .foregroundStyle(Color("BgColor"))
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SearchView()
}
