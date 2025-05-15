import SwiftUI

struct DataPrivacyView: View {
    @State private var shareThird = false
    @State private var usePersonal = true
    @State private var autoSync = true

    var body: some View {
        Form {
            Section(header: Text("Data Sharing")) {
                Toggle("Share with Third Parties", isOn: $shareThird)
                Toggle("Use for Personalization", isOn: $usePersonal)
            }
            Section(header: Text("Sync Settings")) {
                Toggle("Auto-Sync Data", isOn: $autoSync)
                Button("Clear Synced Data") { }
                    .foregroundColor(.red)
            }
            Section {
                Button("Delete Account") { }
                    .foregroundColor(.red)
            }
        }
        .scrollContentBackground(.hidden)
        .background(Color.bg)
        .navigationTitle("Privacy & Sync")
        .navigationBarTitleDisplayMode(.inline)
    }
}
