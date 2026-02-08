import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            BlogView()
                .tabItem {
                    Label("Blog", systemImage: "book.fill")
                }

            VehicleScannerView()
                .tabItem {
                    Label("Escaner", systemImage: "car.fill")
                }

            AboutView()
                .tabItem {
                    Label("Sobre Mi", systemImage: "person.fill")
                }

            ContactView()
                .tabItem {
                    Label("Contacto", systemImage: "envelope.fill")
                }
        }
        .tint(Color("AccentColor"))
    }
}

#Preview {
    ContentView()
}
