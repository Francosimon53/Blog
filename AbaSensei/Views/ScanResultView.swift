import SwiftUI

struct ScanResultView: View {
    let result: ScanResult
    @State private var filterCategory: SoftwareCategory?

    var filteredSoftware: [VehicleSoftware] {
        if let category = filterCategory {
            return result.software.filter { $0.category == category }
        }
        return result.software
    }

    var availableCategories: [SoftwareCategory] {
        Array(Set(result.software.map { $0.category })).sorted { $0.rawValue < $1.rawValue }
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                // Resumen
                VStack(spacing: 12) {
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("\(result.brand) \(result.model)")
                                .font(.title2)
                                .fontWeight(.bold)
                            Text(result.country)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                        Spacer()
                        Text("\(result.totalSoftware)")
                            .font(.system(size: 36, weight: .bold, design: .rounded))
                            .foregroundStyle(.blue)
                        Text("modulos")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }

                    Divider()

                    HStack(spacing: 0) {
                        SummaryItem(count: result.upToDate, label: "Actualizados", color: .green, icon: "checkmark.circle.fill")
                        SummaryItem(count: result.updateAvailable, label: "Disponibles", color: .yellow, icon: "exclamationmark.triangle.fill")
                        SummaryItem(count: result.outdated, label: "Desactualizados", color: .orange, icon: "bolt.fill")
                        SummaryItem(count: result.critical, label: "Criticos", color: .red, icon: "xmark.octagon.fill")
                    }
                }
                .padding()
                .background(Color(.systemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .shadow(color: .black.opacity(0.08), radius: 8, x: 0, y: 2)

                // Filtro por categoria
                VStack(alignment: .leading, spacing: 8) {
                    Text("Filtrar por categoria")
                        .font(.headline)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
                            FilterChip(label: "Todos", isSelected: filterCategory == nil) {
                                withAnimation { filterCategory = nil }
                            }
                            ForEach(availableCategories) { category in
                                FilterChip(
                                    label: category.rawValue,
                                    isSelected: filterCategory == category
                                ) {
                                    withAnimation { filterCategory = category }
                                }
                            }
                        }
                    }
                }

                // Lista de software
                VStack(alignment: .leading, spacing: 8) {
                    Text("Software (\(filteredSoftware.count))")
                        .font(.headline)

                    ForEach(filteredSoftware) { sw in
                        SoftwareRow(software: sw)
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Resultado")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Componentes

struct SummaryItem: View {
    let count: Int
    let label: String
    let color: Color
    let icon: String

    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: icon)
                .foregroundStyle(color)
            Text("\(count)")
                .font(.title3)
                .fontWeight(.bold)
            Text(label)
                .font(.caption2)
                .foregroundStyle(.secondary)
                .lineLimit(1)
                .minimumScaleFactor(0.8)
        }
        .frame(maxWidth: .infinity)
    }
}

struct FilterChip: View {
    let label: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(label)
                .font(.caption)
                .fontWeight(isSelected ? .bold : .regular)
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(isSelected ? Color.blue.opacity(0.15) : Color(.systemGray6))
                .foregroundStyle(isSelected ? .blue : .primary)
                .clipShape(Capsule())
                .overlay(
                    Capsule().stroke(isSelected ? Color.blue : Color.clear, lineWidth: 1)
                )
        }
    }
}

struct SoftwareRow: View {
    let software: VehicleSoftware

    var statusColor: Color {
        switch software.status {
        case .upToDate: return .green
        case .updateAvailable: return .yellow
        case .outdated: return .orange
        case .critical: return .red
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: software.status.icon)
                    .foregroundStyle(statusColor)

                Text(software.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)

                Spacer()

                Text(software.category.rawValue)
                    .font(.caption2)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 2)
                    .background(Color(.systemGray5))
                    .clipShape(Capsule())
            }

            HStack {
                Label(software.currentVersion, systemImage: "tag")
                    .font(.caption)
                    .foregroundStyle(.secondary)

                Image(systemName: "arrow.right")
                    .font(.caption2)
                    .foregroundStyle(.secondary)

                Label(software.latestVersion, systemImage: "tag.fill")
                    .font(.caption)
                    .foregroundStyle(software.currentVersion == software.latestVersion ? .secondary : statusColor)
            }

            Text(software.status.rawValue)
                .font(.caption)
                .fontWeight(.medium)
                .foregroundStyle(statusColor)
        }
        .padding()
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 1)
    }
}

#Preview {
    NavigationStack {
        ScanResultView(result: ScanResult(
            brand: "Toyota",
            model: "Corolla",
            country: "Japon",
            software: VehicleDatabase.brands[0].models[0].software
        ))
    }
}
