import Foundation


struct Exercise: Identifiable {
    let id = UUID()
    let name: String
}

// ViewModel
final class WorkoutPlanViewModel: ObservableObject {
    enum Goal: Int {
        case buildMuscle = 0, maintain, loseFat
    }

    @Published var workout: [Exercise] = []

    // Generates a list of exercises
    func generate(
        for goal: Goal,
        injured: Bool,
        durationMinutes: Int
    ) {
        // pick a pool of exercise names based on goal
        var pool: [String]
        switch goal {
            //
        case .buildMuscle:
            pool = ["Push-ups", "Squats", "Deadlifts", "Bench Press", "Pull-ups"]
        case .maintain:
            pool = ["Jogging", "Cycling", "Rowing", "Plank", "Lunges"]
        case .loseFat:
            pool = ["Treadmill", "Stair Master", "Jump Rope", "Burpees", "Mountain Climbers"]
        }

        // if injured, remove anything that hard
        if injured {
            let disallowed = ["Deadlifts", "Burpees", "Pull-ups", "Mountain Climbers"]
            pool.removeAll { disallowed.contains($0) }
        }

        // decide how many exercises (approx one per 10 min)
        let count = max(1, durationMinutes / 10)

        //  randomly pick `count` unique exercises
        var picks = [Exercise]()
        
        var available = pool
        for _ in 0..<count {
            //picks random here
            guard let choice = available.randomElement() else {
                break
            }
            
            //puts raw String name in an Exercise and add it to our results
            picks.append(Exercise(name: choice))
            
            available.removeAll { $0 == choice }
        }

        
        //
        DispatchQueue.main.async {
            self.workout = picks
        }
    }
}
