import SwiftUI

struct UserStatView: View {
    var value: Int
    var title: String
    
    var body: some View {
        VStack {
            Text("\(value)")
                .font(.subheadline)
                .fontWeight(.semibold)
            Text(title)
                .font(.footnote)
        }
        .foregroundStyle(Color("textColor"))
        .frame(width: 72)
    }
}

#Preview {
    UserStatView(value: 69, title: "Title")
}
