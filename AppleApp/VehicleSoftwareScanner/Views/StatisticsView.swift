import SwiftUI

struct StatisticsView: View {
    @ObservedObject var scanner: VehicleSoftwareScannerEngine

    private var stats: ScannerStatistics {
        scanner.getStatistics()
    }

    var body: some View {
        List {
            // General overview
            Section("Vista General") {
                HStack(spacing: 0) {
                    StatCard(value: stats.totalBrands, label: "Marcas", icon: "building.2", color: .blue)
                    StatCard(value: stats.totalModels, label: "Modelos", icon: "car", color: .indigo)
                    StatCard(value: stats.totalSoftware, label: "Software", icon: "cpu", color: .purple)
                }
            }

            // Status breakdown
            Section("Por Estado") {
                StatusRow(
                    label: "Actualizados",
                    count: stats.byStatus.upToDate,
                    total: stats.totalSoftware,
                    color: .green,
                    icon: "checkmark.circle.fill"
                )
                StatusRow(
                    label: "Actualizacion disponible",
                    count: stats.byStatus.updateAvailable,
                    total: stats.totalSoftware,
                    color: .orange,
                    icon: "exclamationmark.triangle.fill"
                )
                StatusRow(
                    label: "Desactualizados",
                    count: stats.byStatus.outdated,
                    total: stats.totalSoftware,
                    color: .red,
                    icon: "xmark.circle.fill"
                )
                StatusRow(
                    label: "Criticos",
                    count: stats.byStatus.critical,
                    total: stats.totalSoftware,
                    color: .red,
                    icon: "bolt.trianglebadge.exclamationmark.fill"
                )
            }

            // Category breakdown
            Section("Por Categoria") {
                ForEach(stats.byCategory, id: \.category) { item in
                    HStack {
                        Image(systemName: item.category.icon)
                            .foregroundStyle(.blue)
                            .frame(width: 24)

                        Text(item.category.shortName)
                            .font(.subheadline)

                        Spacer()

                        Text("\(item.count)")
                            .font(.subheadline.bold())
                            .foregroundStyle(.secondary)
                    }
                }
            }

            // Brands breakdown
            Section("Por Marca") {
                ForEach(scanner.brands) { brand in
                    HStack {
                        Text(brand.flagEmoji)

                        Text(brand.name)
                            .font(.subheadline)

                        Spacer()

                        VStack(alignment: .trailing) {
                            Text("\(brand.models.count) modelos")
                                .font(.caption)
                                .foregroundStyle(.secondary)

                            let totalSW = brand.models.reduce(0) { $0 + $1.softwareList.count }
                            Text("\(totalSW) software")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
        }
        .navigationTitle("Estadisticas")
        .listStyle(.insetGrouped)
    }
}

struct StatCard: View {
    let value: Int
    let label: String
    let icon: String
    let color: Color

    var body: some View {
        VStack(spacing: 6) {
            Image(systemName: icon)
                .font(.title3)
                .foregroundStyle(color)

            Text("\(value)")
                .font(.title2.bold())

            Text(label)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 4)
    }
}

struct StatusRow: View {
    let label: String
    let count: Int
    let total: Int
    let color: Color
    let icon: String

    private var percentage: Double {
        guard total > 0 else { return 0 }
        return Double(count) / Double(total)
    }

    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundStyle(color)
                .frame(width: 24)

            Text(label)
                .font(.subheadline)

            Spacer()

            Text("\(count)")
                .font(.subheadline.bold())

            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 3)
                        .fill(Color.secondary.opacity(0.2))

                    RoundedRectangle(cornerRadius: 3)
                        .fill(color)
                        .frame(width: geo.size.width * percentage)
                }
            }
            .frame(width: 60, height: 8)
        }
    }
}

#Preview {
    NavigationStack {
        StatisticsView(scanner: VehicleDatabase.initializeScanner())
    }
}
