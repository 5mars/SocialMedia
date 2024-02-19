import SwiftUI

struct CreateUsernameView: View {
    @State private var username = ""
    
    var body: some View {
        SignUpFlowTemplateView(
            title: "Create username",
            description: "Pick a username for your new account. You can always change it later",
            placeholder: "Username",
            state: $username,
            destination: AnyView(CreatePasswordView()),
            label: "Next",
            secured: false
        )
    }
}

#Preview {
    CreateUsernameView()
}
