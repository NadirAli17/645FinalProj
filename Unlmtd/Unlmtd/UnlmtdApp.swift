import SwiftUI

@main
struct UnlmtApp: App {
    // global state tracker for whether we’re logged in
    @StateObject private var appModel = AppModel()
    
    var body: some Scene {
        WindowGroup {
            // choose root view based on login status
            if appModel.isAuthenticated {
                MainTabBar()
                    .environmentObject(appModel)
            } else {
                AuthNavigator()
                    .environmentObject(appModel)
            }
        }
    }
}


// simple container for app-wide flags
final class AppModel: ObservableObject {
    @Published var isAuthenticated = false
    // in future: other flags like hasSeenIntro, theme, etc.
}
