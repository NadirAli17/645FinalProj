import SwiftUI

// the Auth routes
enum AuthRoute: Hashable {
    case welcome, login
}

// nav
struct AuthNavigator: View {
    @EnvironmentObject private var appModel: AppModel
    
    @State private var path: [AuthRoute] = []

    var body: some View {
        NavigationStack(path: $path) {
            // start at welcome
            
            AuthWelcome(path: $path)
                .navigationDestination(for: AuthRoute.self) { route in
                    switch route {
                    case .welcome:
                        EmptyView()

                    case .login:
                        LoginScreen(onSuccess: {
                            // dummy login, once presed it'll go to main app
                            appModel.isAuthenticated = true
                        })

                        
                    /*case .signup:
                        SignUpScreen(onSuccess: {
                            // after signup goes straight to role select
                            path.append(.roleSelect)
                        })
*/
                }
                }
        }
    }
}
