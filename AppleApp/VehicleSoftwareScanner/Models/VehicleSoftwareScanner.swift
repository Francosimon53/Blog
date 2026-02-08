import Foundation

struct ScanSummary {
    var upToDate: Int = 0
    var updateAvailable: Int = 0
    var outdated: Int = 0
    var critical: Int = 0

    var total: Int { upToDate + updateAvailable + outdated + critical }
}

struct ScanResult: Identifiable {
    let id = UUID()
    let brand: VehicleBrand
    let model: VehicleModel
    let softwareResults: [VehicleSoftware]
    let summary: ScanSummary
}

struct SearchResult: Identifiable {
    let id = UUID()
    let brandName: String
    let modelName: String
    let software: VehicleSoftware
}

struct ScannerStatistics {
    let totalBrands: Int
    let totalModels: Int
    let totalSoftware: Int
    let byCategory: [(category: SoftwareCategory, count: Int)]
    let byStatus: ScanSummary
}

class VehicleSoftwareScannerEngine: ObservableObject {
    @Published var brands: [VehicleBrand] = []

    func addBrand(_ brand: VehicleBrand) {
        brands.append(brand)
    }

    func getBrand(named name: String) -> VehicleBrand? {
        brands.first { $0.name.lowercased() == name.lowercased() }
    }

    func listBrandNames() -> [String] {
        brands.map { $0.name }
    }

    func listModelNames(forBrand brandName: String) -> [String] {
        guard let brand = getBrand(named: brandName) else { return [] }
        return brand.models.map { $0.name }
    }

    func scanVehicle(brandName: String, modelName: String) -> ScanResult? {
        guard let brand = getBrand(named: brandName),
              let model = brand.getModel(named: modelName) else {
            return nil
        }

        var summary = ScanSummary()

        for sw in model.softwareList {
            switch sw.status {
            case .upToDate: summary.upToDate += 1
            case .updateAvailable: summary.updateAvailable += 1
            case .outdated: summary.outdated += 1
            case .critical: summary.critical += 1
            case .unknown: break
            }
        }

        return ScanResult(
            brand: brand,
            model: model,
            softwareResults: model.softwareList,
            summary: summary
        )
    }

    func findUpdatesNeeded(brandName: String, modelName: String) -> [VehicleSoftware] {
        guard let brand = getBrand(named: brandName),
              let model = brand.getModel(named: modelName) else {
            return []
        }
        return model.softwareList.filter { $0.needsUpdate }
    }

    func findCriticalUpdates(brandName: String, modelName: String) -> [VehicleSoftware] {
        guard let brand = getBrand(named: brandName),
              let model = brand.getModel(named: modelName) else {
            return []
        }
        return model.softwareList.filter { $0.status == .critical }
    }

    func searchSoftware(query: String) -> [SearchResult] {
        let queryLower = query.lowercased()
        var results: [SearchResult] = []

        for brand in brands {
            for model in brand.models {
                for sw in model.softwareList {
                    if sw.name.lowercased().contains(queryLower) ||
                       sw.category.rawValue.lowercased().contains(queryLower) ||
                       sw.description.lowercased().contains(queryLower) {
                        results.append(SearchResult(
                            brandName: brand.name,
                            modelName: model.name,
                            software: sw
                        ))
                    }
                }
            }
        }

        return results
    }

    func getStatistics() -> ScannerStatistics {
        var totalModels = 0
        var totalSoftware = 0
        var categoryCount: [SoftwareCategory: Int] = [:]
        var summary = ScanSummary()

        for brand in brands {
            totalModels += brand.models.count

            for model in brand.models {
                totalSoftware += model.softwareList.count

                for sw in model.softwareList {
                    categoryCount[sw.category, default: 0] += 1

                    switch sw.status {
                    case .upToDate: summary.upToDate += 1
                    case .updateAvailable: summary.updateAvailable += 1
                    case .outdated: summary.outdated += 1
                    case .critical: summary.critical += 1
                    case .unknown: break
                    }
                }
            }
        }

        let byCategory = categoryCount
            .sorted { $0.value > $1.value }
            .map { (category: $0.key, count: $0.value) }

        return ScannerStatistics(
            totalBrands: brands.count,
            totalModels: totalModels,
            totalSoftware: totalSoftware,
            byCategory: byCategory,
            byStatus: summary
        )
    }
}
