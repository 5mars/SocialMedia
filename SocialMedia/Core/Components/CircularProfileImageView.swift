import SwiftUI
import Kingfisher

struct CircularProfileImageView: View {
    enum ProfileImageSize {
        case xSmall
        case small
        case medium
        case large
                
        var dimension: CGFloat {
            switch self {
            case .xSmall:
                return 40
            case .small:
                return 48
            case .medium:
                return 64
            case .large:
                return 80
            }
        }
    }
    
    let user: User
    let size: ProfileImageSize
    
    var body: some View {
        if let imageUrl = user.profileImageUrl {
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
                .shadow(radius: 3, x: 3, y: 3)
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
                .foregroundStyle(.red)
                .shadow(radius: 3, x: 3, y: 3)
        }
    }
}

#Preview {
    
//    CircularProfileImageView(user: User.MOCK_USER[1], size: .large)
    SearchView()

}
