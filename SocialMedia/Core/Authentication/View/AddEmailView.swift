import SwiftUI

struct AddEmailView: View {
    @EnvironmentObject var viewModel: RegistrationViewModel
    var body: some View {
        SignUpFlowTemplateView(
            title: "Add your email",
            description: "You'll use this email to sign in to your account",
            placeholder: "Email",
            state: $viewModel.email,
            destination: AnyView(CreateUsernameView()),
            label: "Next",
            secured: false
        )
        .keyboardType(.emailAddress)
    }
}

#Preview {
    AddEmailView()
}
