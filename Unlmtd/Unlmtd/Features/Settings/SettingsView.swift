import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink(destination: AccountInfoView()) {
                    Label("Account Info",    systemImage: "person.crop.circle")
                }
                NavigationLink(destination: SubscriptionPlanView()) {
                    Label("Subscription Plan", systemImage: "creditcard")
                }
                NavigationLink(destination: ConnectedDevicesView()) {
                    Label("Connected Devices", systemImage: "applewatch")
                }
                NavigationLink(destination: HealthGoalsView()) {
                    Label("Health Goals", systemImage: "target")
                }
                NavigationLink(destination: DataPrivacyView()) {
                    Label("Data Privacy & Sync", systemImage: "lock.shield")
                }
            }
            .listStyle(.insetGrouped)
            .scrollContentBackground(.hidden)
            .background(Color.bg)
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
