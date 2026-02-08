import SwiftUI

struct ContentView: View {
    @StateObject private var scanner = VehicleDatabase.initializeScanner()

    var body: some View {
        TabView {
            NavigationStack {
                BrandListView(scanner: scanner)
            }
            .tabItem {
                Label("Marcas", systemImage: "car.2")
            }

            NavigationStack {
                SearchView(scanner: scanner)
            }
            .tabItem {
                Label("Buscar", systemImage: "magnifyingglass")
            }

            NavigationStack {
                StatisticsView(scanner: scanner)
            }
            .tabItem {
                Label("Estadisticas", systemImage: "chart.bar")
            }
        }
        .tint(.blue)
    }
}

#Preview {
    ContentView()
}
