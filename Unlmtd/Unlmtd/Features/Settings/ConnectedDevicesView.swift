import SwiftUI

struct ConnectedDevicesView: View {
    //potential devices this app can connect to that would track information
    @State private var devices = [
        ("Apple Watch","Last synced: Today, 9:15 AM"),
        ("Fitbit Charge 5","Last synced: Yesterday, 3:28 PM")
        
    ]

    var body: some View {
        //adding logos and apple watch name with for loop
        List {
            ForEach(devices, id: \.0) { name,info in
                HStack {
                    Image(systemName: name.contains("Apple") ? "applewatch" : "wave.3.right")
                        .frame(width:30)
                    VStack(alignment:.leading) {
                        Text(name)
                        Text(info).font(.caption).foregroundColor(.textSecondary)
                    }
                    Spacer()
                    Button("Remove") { }
                        .foregroundColor(.red)
                }
            }
            Button("Add New Device") { }
                .frame(maxWidth:.infinity)
        }
        .listStyle(.insetGrouped)
        .scrollContentBackground(.hidden)
        .background(Color.bg)
        .navigationTitle("Devices")
        .navigationBarTitleDisplayMode(.inline)
    }
}
