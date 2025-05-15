import SwiftUI

struct WorkoutPlanGeneratorView: View {
  // 
  @State private var selectedGoal = 0
  @State private var hasInjury = false
  @State private var durationIndex = 1

  //  important, how I call other class
  @StateObject private var vm = WorkoutPlanViewModel()

  private let goals = ["Build Muscle", "Maintain", "Lose Fat"]
  private let durations = [20, 30, 40, 60]

  var body: some View {
    NavigationStack {
      Form {
        // goal picker
        Section(header:
                  Text("GOAL")
                    .foregroundColor(.white)
                    .font(.caption)
        ) {
          Picker("", selection: $selectedGoal) {
            ForEach(0..<goals.count, id: \.self) { i in
              Text(goals[i]).tag(i)
            }
          }
          .pickerStyle(.segmented)
        }

        //injury toggle button
        Section(header:
                  Text("INJURIES?")
                    .foregroundColor(.white)
                    .font(.caption)
        ) {
          Toggle(isOn: $hasInjury) {
            Text("Any injuries?")
              .foregroundColor(.black)
              .bold()
          }
          .tint(.blue)
        }

        // how long u workout
        Section(header:
                  Text("WORKOUT DURATION")
                    .foregroundColor(.white)
                    .font(.caption)
        ) {
          Picker("", selection: $durationIndex) {
            ForEach(0..<durations.count, id: \.self) { i in
              Text("\(durations[i]) min").tag(i)
            }
          }
          .pickerStyle(.segmented)
        }

        //
        Section {
          Button(vm.workout.isEmpty ? "Start Workout" : "Start Another Workout") {
            let goal = WorkoutPlanViewModel.Goal(rawValue: selectedGoal)!
            let mins = durations[durationIndex]
            vm.generate(for: goal,
                        injured: hasInjury,
                        durationMinutes: mins)
          }
          .frame(maxWidth: .infinity)
          .padding()
          .background(Color.blue)
          .foregroundColor(.white)
          .cornerRadius(8)
        }

        // generate workout, vm holds the generator in other file
        if !vm.workout.isEmpty {
          Section(header:
                    Text("YOUR WORKOUT")
                      .foregroundColor(.white)
                      .font(.caption)
          ) {
            ForEach(vm.workout) { ex in
              Text("• \(ex.name)")
                .foregroundColor(.black)
            }
          }
        }
      }
      .scrollContentBackground(.hidden)
      .background(Color.black)
      .navigationTitle("Workout Plan")
      .navigationBarTitleDisplayMode(.inline)
    }
  }
}
