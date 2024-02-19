import SwiftUI

struct AddEmailView: View {
    @State private var email = ""
    
    var body: some View {
        SignUpFlowTemplateView(
            title: "Add your email",
            description: "You'll use this email to sign in to your account",
            placeholder: "Email",
            state: $email,
            destination: AnyView(CreateUsernameView()),
            label: "Next",
            secured: false
        )
    }
}

#Preview {
    AddEmailView()
}
