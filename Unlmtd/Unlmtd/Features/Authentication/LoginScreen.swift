import SwiftUI

struct LoginScreen: View {
    var onSuccess: () -> Void

    //empty
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        VStack(spacing: 24) {
            Text("Login")
                .font(.largeTitle)
                .foregroundColor(.textPrimary)

            // email & password
            TextField("Email", text: $email)
                .textFieldStyle(.roundedBorder)
                .autocapitalization(.none)
            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)

            Button("Log In") {
                // itll accept anything
                onSuccess()
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.accent)
            .foregroundColor(.textPrimary)
            .cornerRadius(8)

            Button("Sign Up Instead") {
                onSuccess() // or navigate to signup
            }
            .foregroundColor(.textSecondary)

            Spacer()
        }
        .padding()
        .background(Color.bg.ignoresSafeArea())
    }
}
