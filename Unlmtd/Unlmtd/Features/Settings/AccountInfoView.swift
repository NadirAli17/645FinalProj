import SwiftUI

struct AccountInfoView: View {
    //my info
    @State private var fullName = "Nadir Ali"
    @State private var email    = "nali1@sfsu.edu"
    
    //
    @State private var password = "••••••••"

    var body: some View {
        Form {
            Section {
                HStack { Spacer()
                    Image(systemName: "person.circle.fill")
                        .resizable().frame(width:80,height:80)
                        .foregroundColor(.textSecondary)
                    Spacer()
                }
            }
            Section(header: Text("Full Name")) {
                TextField("", text: $fullName)
                    .textFieldStyle(.roundedBorder)
            }
            Section(header: Text("Email Address")) {
                TextField("", text: $email)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.emailAddress)
            }
            Section(header: Text("Password")) {
                HStack {
                    SecureField("", text: $password)
                        .textFieldStyle(.roundedBorder)
                    Button("Change") { }
                        .foregroundColor(.accent)
                }
            }
            Button("Save Changes") { }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.accent)
                .foregroundColor(.textPrimary)
                .cornerRadius(8)
        }
        .scrollContentBackground(.hidden)
        .background(Color.bg)
        .navigationTitle("Account Info")
        .navigationBarTitleDisplayMode(.inline)
    }
}
