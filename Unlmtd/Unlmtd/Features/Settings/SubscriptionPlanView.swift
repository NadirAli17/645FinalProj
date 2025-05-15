import SwiftUI

struct SubscriptionPlanView: View {
    @State private var plan    = "Premium"
    @State private var renewal = "June 30, 2025"
    @State private var card    = "Visa •••• 1234"

    var body: some View {
        Form {
            Section(header: Text("Current Plan")) {
                Text(plan)
            }
            Section(header: Text("Renewal Date")) {
                Text(renewal)
            }
            Section(header: Text("Payment Method")) {
                Text(card)
                Button("Update Card") { }
            }
            Section {
                Button("Upgrade")   { }
                Button("Downgrade") { }
                Button("Cancel Subscription") { }
                    .foregroundColor(.red)
            }
        }
        .scrollContentBackground(.hidden)
        .background(Color.bg)
        .navigationTitle("Subscription")
        .navigationBarTitleDisplayMode(.inline)
    }
}
