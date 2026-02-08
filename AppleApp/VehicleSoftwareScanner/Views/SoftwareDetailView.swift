import SwiftUI

struct SoftwareDetailView: View {
    let software: VehicleSoftware
    let brand: VehicleBrand
    let model: VehicleModel

    var body: some View {
        List {
            // Status header
            Section {
                VStack(spacing: 16) {
                    Image(systemName: software.status.icon)
                        .font(.system(size: 50))
                        .foregroundStyle(software.status.color)

                    Text(software.name)
                        .font(.title2.bold())
                        .multilineTextAlignment(.center)

                    Text(software.status.rawValue)
                        .font(.headline)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 6)
                        .background(software.status.color.opacity(0.15))
                        .foregroundStyle(software.status.color)
                        .clipShape(Capsule())
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 8)
            }

            // Vehicle info
            Section("Vehiculo") {
                LabeledContent("Marca", value: "\(brand.flagEmoji) \(brand.name)")
                LabeledContent("Modelo", value: model.displayName)
                LabeledContent("Pais", value: brand.country)
            }

            // Software info
            Section("Informacion del Software") {
                LabeledContent("Categoria") {
                    HStack {
                        Image(systemName: software.category.icon)
                        Text(software.category.rawValue)
                    }
                    .font(.subheadline)
                }

                LabeledContent("Version actual", value: software.version)
                LabeledContent("Ultima version", value: software.latestVersion)
                LabeledContent("Fecha de release", value: software.releaseDate)

                if !software.description.isEmpty {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Descripcion")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        Text(software.description)
                            .font(.body)
                    }
                }
            }

            // Update action
            if software.needsUpdate {
                Section {
                    Button(action: {}) {
                        HStack {
                            Spacer()
                            Image(systemName: "arrow.down.circle.fill")
                            Text(software.status == .critical ? "Actualizar (Critico)" : "Actualizar Software")
                                .bold()
                            Spacer()
                        }
                        .padding(.vertical, 4)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(software.status == .critical ? .red : .blue)
                    .listRowBackground(Color.clear)
                    .listRowInsets(EdgeInsets())
                }
            }
        }
        .navigationTitle("Detalle")
        .listStyle(.insetGrouped)
    }
}

#Preview {
    NavigationStack {
        SoftwareDetailView(
            software: VehicleSoftware(
                name: "Toyota ECU-M",
                version: "3.2.1",
                category: .ecu,
                latestVersion: "3.4.0",
                releaseDate: "2024-06-15",
                description: "Unidad de control del motor principal"
            ),
            brand: VehicleBrand(name: "Toyota", country: "Japon"),
            model: VehicleModel(name: "Corolla", yearStart: 2019, yearEnd: 2024)
        )
    }
}
