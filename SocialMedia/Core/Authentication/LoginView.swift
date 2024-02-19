import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                //logo image
                Image("abimo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220, height: 100)
                
                //text fields
                VStack {
                    TextField("Enter your email", text: $email)
                        .textInputAutocapitalization(.none)
                        .modifier(TextFieldModifier())
                    
                    SecureField("Enter your password", text: $password)
                        .modifier(TextFieldModifier())
                }
                
                Button {
                    print("Show Forgot Password")
                } label: {
                    Text("Forgot Password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 26)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                Button {
                    print("Login")
                } label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360, height: 44)
                        .background(.blue)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .padding(.vertical)
                
                HStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: .infinity, height: 0.5)
                    
                    Text("OR")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Rectangle()
                        .frame(width: .infinity, height: 0.5)
                }
                .foregroundStyle(.gray)
                .padding(.horizontal)
                
                HStack {
                    Image("facebook-logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 24, height: 24)
                    
                    Text("Continue with Facebook")
                        .font(.footnote)
                        .foregroundStyle(.blue)
                        .fontWeight(.semibold)
                }
                .padding(.top, 8)
                
                Spacer()
                
                Divider()
                
                NavigationLink {
                    AddEmailView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account yet?")
                        
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                }
                .font(.footnote)
                .padding(.vertical)
            }
        }
    }
}

#Preview {
    LoginView()
}
