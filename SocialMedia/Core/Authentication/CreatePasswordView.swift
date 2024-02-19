import SwiftUI

struct CreatePasswordView: View {
    @State private var password = ""
    
    var body: some View {
        SignUpFlowTemplateView(
            title: "Create password",
            description: "Your password must be at least 6 characters in length",
            placeholder: "Password",
            state: $password,
            destination: AnyView(CompleteSignUpView()),
            label: "Next",
            secured: true
        )
    }
}

#Preview {
    CreatePasswordView()
}
