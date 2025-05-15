import SwiftUI

struct AuthWelcome: View {
    // binds to authroute
    @Binding var path: [AuthRoute]

    var body: some View {
        VStack(spacing: 32) {
            Spacer()

            //welcome text
            Text("Welcome")
                .font(.largeTitle)
                .foregroundColor(.white)

            Button("Get Started") {
                // push the login screen, works no mattter what no back end yet
                path.append(.login)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)

            //
            Spacer()
        }
        .padding()
        .background(Color.black.ignoresSafeArea())
    }
}
