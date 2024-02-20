import SwiftUI

struct CreateUsernameView: View {
    @EnvironmentObject var viewModel: RegistrationViewModel
    
    var body: some View {
        SignUpFlowTemplateView(
            title: "Create username",
            description: "Pick a username for your new account. You can always change it later",
            placeholder: "Username",
            state: $viewModel.username,
            destination: AnyView(CreatePasswordView()),
            label: "Next",
            secured: false
        )
    }
}

#Preview {
    CreateUsernameView()
}
