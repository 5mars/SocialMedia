import SwiftUI

struct CustomTextField: View {
    @State var text: String
    var body: some View {
        ZStack {
            TextField(text: $text) {
                Text("placeholder")
            }
        }
    }
}

#Preview {
    CustomTextField(text: "")
        .background {
            Rectangle()
                .ignoresSafeArea()
                .foregroundStyle(Color("BgColor"))
        }
}
