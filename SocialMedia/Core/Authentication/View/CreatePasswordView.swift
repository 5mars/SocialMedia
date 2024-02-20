import SwiftUI

struct CreatePasswordView: View {
    @EnvironmentObject var viewModel: RegistrationViewModel
    
    var body: some View {
        SignUpFlowTemplateView(
            title: "Create password",
            description: "Your password must be at least 6 characters in length",
            placeholder: "Password",
            state: $viewModel.password,
            destination: AnyView(CompleteSignUpView()),
            label: "Next",
            secured: true
        )
    }
}

#Preview {
    CreatePasswordView()
}
