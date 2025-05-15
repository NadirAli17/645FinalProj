import SwiftUI

//progress bar, gonna try and add to this
struct ProgressReportsView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing:24) {
                Text("Weekly Overview")
                    .font(.headline)
                    .foregroundColor(.textPrimary)

                RoundedRectangle(cornerRadius:12)
                    .fill(Color.cardBg)
                    .frame(height:200)
                    .overlay(
                        Text("Recovery vs. Training Chart")
                            .foregroundColor(.textSecondary)
                    )

                Spacer()
            }
            .padding()
            .background(Color.bg)
            .navigationTitle("Progress & Reports")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
