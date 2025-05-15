import SwiftUI

struct MainTabBar: View {
    //declaring
    @State private var selection: Int = 0

    // bottom tab bar in app
    var body: some View {
        TabView(selection: $selection) {
            HomeDashboardView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .tag(0)

            
            ProgressReportsView()
                .tabItem {
                    Label("Progress", systemImage: "chart.line.uptrend.xyaxis")
                }
                .tag(1)

            WorkoutPlanGeneratorView()
                .tabItem {
                    Label("Plan", systemImage: "calendar.badge.plus")
                }
                .tag(2)

            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
                .tag(3)
        }
        .tint(.white)                         // making txt white so it pops out
        .background(Color.black.ignoresSafeArea())
    }
}
