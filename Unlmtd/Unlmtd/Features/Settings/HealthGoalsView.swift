import SwiftUI

struct HealthGoalsView: View {
    // jusy putting a dummy amount, user cna change info on app with slider
    @State private var weight = 150.0
    @State private var steps  = 10_000
    @State private var sleep  = 8.0
    @State private var freq   = 3

    var body: some View {
        Form {
            Section(header: Text("Weight Goal")) {
                HStack {
                    //putting weight range from 80-400 lbs
                    Slider(value: $weight, in: 80...400, step:1)
                    Text("\(Int(weight)) lbs")
                }
            }
            Section(header: Text("Daily Steps")) {
                Stepper("\(steps) steps", value: $steps, in:0...40000, step:500)
            }
            Section(header: Text("Sleep Goal")) {
                HStack {
                    //minimum 4 hours of sleep because of its importance
                    Slider(value: $sleep, in:4...10, step:0.5)
                    Text("\(String(format: "%.1f", sleep)) hr")
                }
            }
            Section(header: Text("Workouts per Week")) {
                Picker("", selection: $freq) {
                    ForEach(1..<8) { i in Text("\(i)x/week") }
                }
                .pickerStyle(.segmented)
            }
            Button("Save Changes") { }
                .frame(maxWidth:.infinity)
                .padding()
                .background(Color.accent)
                .foregroundColor(.textPrimary)
                .cornerRadius(8)
        }
        .scrollContentBackground(.hidden)
        .background(Color.bg)
        .navigationTitle("Health Goals")
        .navigationBarTitleDisplayMode(.inline)
    }
}
