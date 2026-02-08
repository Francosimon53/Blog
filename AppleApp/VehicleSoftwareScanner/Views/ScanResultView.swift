import SwiftUI

struct ScanResultView: View {
    @ObservedObject var scanner: VehicleSoftwareScannerEngine
    let brand: VehicleBrand
    let model: VehicleModel

    @State private var filterStatus: SoftwareStatus?
    @State private var filterCategory: SoftwareCategory?

    private var scanResult: ScanResult? {
        scanner.scanVehicle(brandName: brand.name, modelName: model.name)
    }

    private var filteredSoftware: [VehicleSoftware] {
        guard let result = scanResult else { return [] }
        return result.softwareResults.filter { sw in
            if let status = filterStatus, sw.status != status { return false }
            if let category = filterCategory, sw.category != category { return false }
            return true
        }
    }

    var body: some View {
        List {
            if let result = scanResult {
                // Summary section
                Section("Resumen del Escaneo") {
                    VStack(spacing: 12) {
                        HStack {
                            Text(brand.flagEmoji)
                                .font(.title)
                            VStack(alignment: .leading) {
                                Text("\(brand.name) \(model.name)")
                                    .font(.headline)
                                Text(model.yearRange)
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                            }
                            Spacer()
                            Text("\(result.softwareResults.count)")
                                .font(.title2.bold())
                            Text("modulos")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }

                        Divider()

                        HStack(spacing: 0) {
                            StatusBadge(
                                count: result.summary.upToDate,
                                label: "OK",
                                color: .green,
                                icon: "checkmark.circle.fill"
                            )
                            StatusBadge(
                                count: result.summary.updateAvailable,
                                label: "Pendiente",
                                color: .orange,
                                icon: "exclamationmark.triangle.fill"
                            )
                            StatusBadge(
                                count: result.summary.outdated,
                                label: "Antiguo",
                                color: .red,
                                icon: "xmark.circle.fill"
                            )
                            StatusBadge(
                                count: result.summary.critical,
                                label: "Critico",
                                color: .red,
                                icon: "bolt.trianglebadge.exclamationmark.fill"
                            )
                        }
                    }
                    .padding(.vertical, 4)
                }

                // Filters
                Section("Filtros") {
                    Picker("Estado", selection: $filterStatus) {
                        Text("Todos").tag(nil as SoftwareStatus?)
                        Text("Actualizado").tag(SoftwareStatus.upToDate as SoftwareStatus?)
                        Text("Pendiente").tag(SoftwareStatus.updateAvailable as SoftwareStatus?)
                        Text("Desactualizado").tag(SoftwareStatus.outdated as SoftwareStatus?)
                        Text("Critico").tag(SoftwareStatus.critical as SoftwareStatus?)
                    }

                    Picker("Categoria", selection: $filterCategory) {
                        Text("Todas").tag(nil as SoftwareCategory?)
                        ForEach(SoftwareCategory.allCases) { cat in
                            Text(cat.shortName).tag(cat as SoftwareCategory?)
                        }
                    }
                }

                // Software list
                Section("Software (\(filteredSoftware.count))") {
                    ForEach(filteredSoftware) { sw in
                        NavigationLink(destination: SoftwareDetailView(software: sw, brand: brand, model: model)) {
                            SoftwareRow(software: sw)
                        }
                    }
                }
            }
        }
        .navigationTitle("Escaneo")
        .listStyle(.insetGrouped)
    }
}

struct StatusBadge: View {
    let count: Int
    let label: String
    let color: Color
    let icon: String

    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: icon)
                .foregroundStyle(color)
                .font(.title3)

            Text("\(count)")
                .font(.title3.bold())

            Text(label)
                .font(.caption2)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
    }
}

struct SoftwareRow: View {
    let software: VehicleSoftware

    var body: some View {
        HStack {
            Image(systemName: software.status.icon)
                .foregroundStyle(software.status.color)
                .font(.title3)

            VStack(alignment: .leading, spacing: 4) {
                Text(software.name)
                    .font(.subheadline.bold())

                HStack(spacing: 4) {
                    Image(systemName: software.category.icon)
                        .font(.caption)
                    Text(software.category.shortName)
                        .font(.caption)
                }
                .foregroundStyle(.secondary)

                HStack {
                    Text("v\(software.version)")
                        .font(.caption)
                    if software.version != software.latestVersion {
                        Image(systemName: "arrow.right")
                            .font(.caption2)
                        Text("v\(software.latestVersion)")
                            .font(.caption)
                            .foregroundStyle(software.status.color)
                    }
                }
                .foregroundStyle(.secondary)
            }

            Spacer()

            Text(software.status.rawValue)
                .font(.caption2)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(software.status.color.opacity(0.15))
                .foregroundStyle(software.status.color)
                .clipShape(Capsule())
        }
        .padding(.vertical, 2)
    }
}

#Preview {
    NavigationStack {
        ScanResultView(
            scanner: VehicleDatabase.initializeScanner(),
            brand: VehicleDatabase.createToyota(),
            model: VehicleDatabase.createToyota().models[0]
        )
    }
}
