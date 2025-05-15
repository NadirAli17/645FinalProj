import SwiftUI

struct HomeDashboardView: View {
    // gonna put this as dummy data for recovery out of 100
    let readiness: Double = 0.82

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    // Recovery Readiness Circle, 82/100 hard coded
                    VStack {
                        Text("Your Recovery Readiness")
                            .foregroundColor(.white)
                            .font(.headline)

                        ZStack {
                            // background track
                            Circle()
                                .stroke(
                                    Color.white.opacity(0.2),
                                    style: StrokeStyle(lineWidth: 12)
                                )
                                .frame(width: 140, height: 140)

                            
                            // Progress arc, kinda cool
                            Circle()
                                .trim(from: 0, to: readiness)
                                .stroke(
                                    Color.blue,
                                    style: StrokeStyle(lineWidth: 12, lineCap: .round)
                                )
                                .rotationEffect(.degrees(-90))
                                .frame(width: 140, height: 140)

                            // Center percentage
                            Text("\(Int(readiness * 100))")
                                .font(.largeTitle)
                                .bold()
                                .foregroundColor(.white)
                        }

                        
                        Text(readiness >= 0.8 ? "Good to Train" : "Take It Easy")
                            .foregroundColor(.white)
                            .font(.subheadline)
                    }
                    .padding(.top, 40)

                    //  stats grid
                    QuickStatsGrid()

                    Spacer()
                }
            }
            .background(Color.black)
            .scrollIndicators(.hidden)
            .navigationTitle("Recovery Hub")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// Pull the grid into its own view so it can see StatCard:
private struct QuickStatsGrid: View {
    var body: some View {
        LazyVGrid(columns: [GridItem(), GridItem()], spacing: 16) {
            
            StatCard(title: "Sleep", value: "7h 45m", subtitle: "Good Quality")
            StatCard(title: "Hydration", value: "104 oz", subtitle: "of 120 oz")
            StatCard(title: "Nutrition", value: "165 g Protein", subtitle: "Logged")
            StatCard(title: "Training Readiness", value: "82", subtitle: "Moderate")
        }
        .padding(.horizontal)
    }
}

//  little card component
private struct StatCard: View {
    let title: String
    let value: String
    let subtitle: String

    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.subheadline)
                .foregroundColor(.gray)
            Text(value)
                .font(.headline)
                .foregroundColor(.white)
            Text(subtitle)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 100)
        .background(Color(.systemGray6).opacity(0.1))
        .cornerRadius(12)
    }
}

// Preview
#Preview {
    HomeDashboardView()
        .preferredColorScheme(.dark)
}
