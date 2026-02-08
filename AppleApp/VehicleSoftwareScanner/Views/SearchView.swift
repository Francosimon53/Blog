import SwiftUI

struct SearchView: View {
    @ObservedObject var scanner: VehicleSoftwareScannerEngine
    @State private var searchText = ""

    private var results: [SearchResult] {
        guard !searchText.isEmpty else { return [] }
        return scanner.searchSoftware(query: searchText)
    }

    var body: some View {
        List {
            if searchText.isEmpty {
                Section {
                    VStack(spacing: 12) {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 40))
                            .foregroundStyle(.secondary)

                        Text("Buscar Software")
                            .font(.title3.bold())

                        Text("Busca por nombre de software, categoria o descripcion en toda la base de datos.")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                }

                // Quick search suggestions
                Section("Sugerencias") {
                    ForEach(["ECU", "ADAS", "Bateria", "SYNC", "iDrive", "MBUX"], id: \.self) { suggestion in
                        Button(action: { searchText = suggestion }) {
                            Label(suggestion, systemImage: "magnifyingglass")
                        }
                    }
                }
            } else if results.isEmpty {
                Section {
                    VStack(spacing: 8) {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 30))
                            .foregroundStyle(.secondary)

                        Text("Sin resultados para \"\(searchText)\"")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                }
            } else {
                Section("\(results.count) resultados") {
                    ForEach(results) { result in
                        NavigationLink(destination: SoftwareDetailView(
                            software: result.software,
                            brand: VehicleBrand(name: result.brandName, country: ""),
                            model: VehicleModel(name: result.modelName, yearStart: 0)
                        )) {
                            VStack(alignment: .leading, spacing: 6) {
                                HStack {
                                    Image(systemName: result.software.status.icon)
                                        .foregroundStyle(result.software.status.color)
                                    Text(result.software.name)
                                        .font(.subheadline.bold())
                                }

                                Text("\(result.brandName) \(result.modelName)")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)

                                HStack {
                                    Label(result.software.category.shortName, systemImage: result.software.category.icon)
                                        .font(.caption)
                                    Spacer()
                                    Text("v\(result.software.version)")
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                }
                            }
                            .padding(.vertical, 2)
                        }
                    }
                }
            }
        }
        .navigationTitle("Buscar")
        .searchable(text: $searchText, prompt: "Nombre, categoria o descripcion...")
        .listStyle(.insetGrouped)
    }
}

#Preview {
    NavigationStack {
        SearchView(scanner: VehicleDatabase.initializeScanner())
    }
}
