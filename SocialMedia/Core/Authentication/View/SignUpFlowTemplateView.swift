import SwiftUI

struct SignUpFlowTemplateView: View {
    var title: String
    var description: String
    var placeholder: String
    var state: Binding<String>
    var destination: AnyView?
    var label: String
    var disableBtn: Bool {
        state.wrappedValue.count >= 6
    }
    var secured: Bool
    
    @State var testState = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 12) {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
                .foregroundStyle(.white)
            
            Text(description)
                .font(.footnote)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
            if !secured {
                TextField(placeholder, text: state)
                    .textInputAutocapitalization(.none)
                    .modifier(TextFieldModifier())
                    .padding(.top)
            } else {
                SecureField(placeholder, text: state)
                    .textInputAutocapitalization(.none)
                    .modifier(TextFieldModifier())
                    .padding(.top)
            }

            NavigationLink {
                destination ?? AnyView(CompleteSignUpView())
            } label: {
                Text(label)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 44)
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .disabled(!disableBtn)
            .opacity(!disableBtn ? 0.5 : 1.0)
            .padding(.vertical)
            .navigationBarBackButtonHidden()
            
            Spacer()
        }
        .background {
            Rectangle()
                .ignoresSafeArea()
                .foregroundStyle(Color("BgColor"))
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
    }
    
}

#Preview {
    SignUpFlowTemplateView(
        title: "Title", 
        description: "description",
        placeholder: "placeholder",
        state: .constant(""),
        label: "label",
        secured: false
    )
}
