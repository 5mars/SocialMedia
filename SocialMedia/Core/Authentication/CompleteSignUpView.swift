import SwiftUI

struct CompleteSignUpView: View {
    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            
            Text("Welcome to Abimo, [username]")
                .font(.title2)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.top)
            
            Text("Click below to complete the registration and start using Abimo")
                .font(.footnote)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
            Button {
                print("Complete sign up")
            } label: {
                Text("Complete Sign Up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 360, height: 44)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            
            Spacer()
        }
    }
}

#Preview {
    CompleteSignUpView()
}
