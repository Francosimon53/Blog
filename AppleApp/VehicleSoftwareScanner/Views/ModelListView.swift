import SwiftUI

struct ModelListView: View {
    @ObservedObject var scanner: VehicleSoftwareScannerEngine
    let brand: VehicleBrand

    var body: some View {
        List(brand.models) { model in
            NavigationLink(destination: ScanResultView(scanner: scanner, brand: brand, model: model)) {
                VStack(alignment: .leading, spacing: 6) {
                    Text(model.name)
                        .font(.headline)

                    Text(model.yearRange)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)

                    HStack(spacing: 12) {
                        Label("\(model.softwareList.count) modulos", systemImage: "cpu")
                            .font(.caption)
                            .foregroundStyle(.secondary)

                        let criticalCount = model.softwareList.filter { $0.status == .critical }.count
                        if criticalCount > 0 {
                            Label("\(criticalCount) criticos", systemImage: "exclamationmark.triangle.fill")
                                .font(.caption)
                                .foregroundStyle(.red)
                        }

                        let updateCount = model.softwareList.filter { $0.needsUpdate }.count
                        if updateCount > 0 {
                            Label("\(updateCount) pendientes", systemImage: "arrow.down.circle")
                                .font(.caption)
                                .foregroundStyle(.orange)
                        }
                    }
                }
                .padding(.vertical, 4)
            }
        }
        .navigationTitle("\(brand.flagEmoji) \(brand.name)")
        .listStyle(.insetGrouped)
    }
}

#Preview {
    NavigationStack {
        ModelListView(
            scanner: VehicleDatabase.initializeScanner(),
            brand: VehicleDatabase.createToyota()
        )
    }
}
