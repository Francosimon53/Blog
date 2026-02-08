import SwiftUI

struct VehicleScannerView: View {
    let brands = VehicleDatabase.getAllBrands()
    @State private var selectedBrand: VehicleBrand?
    @State private var selectedModel: VehicleModel?
    @State private var scanResult: ScanResult?
    @State private var isScanning = false
    @State private var showResult = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    // Header
                    VStack(spacing: 8) {
                        Image(systemName: "car.fill")
                            .font(.system(size: 48))
                            .foregroundStyle(.blue)
                        Text("Escaner de Software Vehicular")
                            .font(.title3)
                            .fontWeight(.bold)
                        Text("Selecciona marca y modelo para escanear")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    .padding(.top)

                    // Selector de marca
                    VStack(alignment: .leading, spacing: 8) {
                        Label("Marca", systemImage: "building.2")
                            .font(.headline)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                ForEach(brands) { brand in
                                    BrandChip(
                                        brand: brand,
                                        isSelected: selectedBrand?.id == brand.id
                                    ) {
                                        withAnimation {
                                            selectedBrand = brand
                                            selectedModel = nil
                                            scanResult = nil
                                            showResult = false
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                    }

                    // Selector de modelo
                    if let brand = selectedBrand {
                        VStack(alignment: .leading, spacing: 8) {
                            Label("Modelo", systemImage: "car.side")
                                .font(.headline)
                                .padding(.horizontal)

                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 12) {
                                    ForEach(brand.models) { model in
                                        ModelChip(
                                            model: model,
                                            isSelected: selectedModel?.id == model.id
                                        ) {
                                            withAnimation {
                                                selectedModel = model
                                                showResult = false
                                            }
                                        }
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                        .transition(.move(edge: .top).combined(with: .opacity))
                    }

                    // Boton de escaneo
                    if selectedBrand != nil && selectedModel != nil {
                        Button(action: performScan) {
                            HStack {
                                if isScanning {
                                    ProgressView()
                                        .tint(.white)
                                } else {
                                    Image(systemName: "magnifyingglass")
                                }
                                Text(isScanning ? "Escaneando..." : "Iniciar Escaneo")
                                    .fontWeight(.semibold)
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                        }
                        .disabled(isScanning)
                        .padding(.horizontal)
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                    }

                    // Resultado
                    if showResult, let result = scanResult {
                        NavigationLink(destination: ScanResultView(result: result)) {
                            ScanSummaryCard(result: result)
                        }
                        .buttonStyle(.plain)
                        .padding(.horizontal)
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                    }

                    // Estadisticas generales
                    StatisticsSection()
                        .padding(.horizontal)
                }
                .padding(.bottom, 20)
            }
            .navigationTitle("Escaner")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    private func performScan() {
        guard let brand = selectedBrand, let model = selectedModel else { return }
        isScanning = true
        showResult = false

        // Simular tiempo de escaneo
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation {
                scanResult = VehicleDatabase.scanVehicle(brand: brand.name, model: model.name)
                isScanning = false
                showResult = true
            }
        }
    }
}

// MARK: - Componentes auxiliares

struct BrandChip: View {
    let brand: VehicleBrand
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                Text(brand.name)
                    .font(.subheadline)
                    .fontWeight(isSelected ? .bold : .regular)
                Text(brand.country)
                    .font(.caption2)
                    .foregroundStyle(.secondary)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(isSelected ? Color.blue.opacity(0.15) : Color(.systemGray6))
            .foregroundStyle(isSelected ? .blue : .primary)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(isSelected ? Color.blue : Color.clear, lineWidth: 2)
            )
        }
    }
}

struct ModelChip: View {
    let model: VehicleModel
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                Text(model.name)
                    .font(.subheadline)
                    .fontWeight(isSelected ? .bold : .regular)
                Text("\(model.year)")
                    .font(.caption2)
                    .foregroundStyle(.secondary)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(isSelected ? Color.blue.opacity(0.15) : Color(.systemGray6))
            .foregroundStyle(isSelected ? .blue : .primary)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(isSelected ? Color.blue : Color.clear, lineWidth: 2)
            )
        }
    }
}

struct ScanSummaryCard: View {
    let result: ScanResult

    var body: some View {
        VStack(spacing: 12) {
            HStack {
                VStack(alignment: .leading) {
                    Text("\(result.brand) \(result.model)")
                        .font(.headline)
                    Text(result.country)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundStyle(.secondary)
            }

            Divider()

            HStack(spacing: 16) {
                StatusBadge(count: result.upToDate, label: "OK", color: .green)
                StatusBadge(count: result.updateAvailable, label: "Upd", color: .yellow)
                StatusBadge(count: result.outdated, label: "Old", color: .orange)
                StatusBadge(count: result.critical, label: "Crit", color: .red)
            }

            Text("Toca para ver detalles completos")
                .font(.caption)
                .foregroundStyle(.blue)
        }
        .padding()
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: .black.opacity(0.08), radius: 8, x: 0, y: 2)
    }
}

struct StatusBadge: View {
    let count: Int
    let label: String
    let color: Color

    var body: some View {
        VStack(spacing: 4) {
            Text("\(count)")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(color)
            Text(label)
                .font(.caption2)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
    }
}

struct StatisticsSection: View {
    let stats = VehicleDatabase.getStatistics()

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Estadisticas Generales", systemImage: "chart.bar.fill")
                .font(.headline)

            HStack(spacing: 12) {
                StatCard(title: "Marcas", value: "\(stats.totalBrands)", icon: "building.2", color: .blue)
                StatCard(title: "Modelos", value: "\(stats.totalModels)", icon: "car.2", color: .green)
                StatCard(title: "Software", value: "\(stats.totalSoftware)", icon: "cpu", color: .purple)
            }

            // Status breakdown
            VStack(spacing: 8) {
                ForEach(SoftwareStatus.allCases) { status in
                    let count = stats.byStatus[status] ?? 0
                    HStack {
                        Image(systemName: status.icon)
                            .foregroundStyle(statusColor(status))
                            .frame(width: 24)
                        Text(status.rawValue)
                            .font(.subheadline)
                        Spacer()
                        Text("\(count)")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(statusColor(status))
                    }
                }
            }
            .padding()
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }

    private func statusColor(_ status: SoftwareStatus) -> Color {
        switch status {
        case .upToDate: return .green
        case .updateAvailable: return .yellow
        case .outdated: return .orange
        case .critical: return .red
        }
    }
}

struct StatCard: View {
    let title: String
    let value: String
    let icon: String
    let color: Color

    var body: some View {
        VStack(spacing: 6) {
            Image(systemName: icon)
                .font(.title3)
                .foregroundStyle(color)
            Text(value)
                .font(.title2)
                .fontWeight(.bold)
            Text(title)
                .font(.caption2)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 12)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    VehicleScannerView()
}
