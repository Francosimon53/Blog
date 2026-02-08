import SwiftUI

struct BrandListView: View {
    @ObservedObject var scanner: VehicleSoftwareScannerEngine

    var body: some View {
        List(scanner.brands) { brand in
            NavigationLink(destination: ModelListView(scanner: scanner, brand: brand)) {
                HStack(spacing: 14) {
                    Text(brand.flagEmoji)
                        .font(.largeTitle)

                    VStack(alignment: .leading, spacing: 4) {
                        Text(brand.name)
                            .font(.headline)

                        Text(brand.country)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)

                        Text("\(brand.models.count) modelos")
                            .font(.caption)
                            .foregroundStyle(.tertiary)
                    }
                }
                .padding(.vertical, 4)
            }
        }
        .navigationTitle("Vehicle Scanner")
        .listStyle(.insetGrouped)
    }
}

#Preview {
    NavigationStack {
        BrandListView(scanner: VehicleDatabase.initializeScanner())
    }
}
