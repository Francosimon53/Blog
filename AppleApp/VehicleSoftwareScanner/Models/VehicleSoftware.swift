import Foundation

struct VehicleSoftware: Identifiable, Codable {
    let id: UUID
    let name: String
    let version: String
    let category: SoftwareCategory
    let latestVersion: String
    let releaseDate: String
    let description: String
    let criticalUpdate: Bool

    init(
        name: String,
        version: String,
        category: SoftwareCategory,
        latestVersion: String,
        releaseDate: String,
        description: String = "",
        criticalUpdate: Bool = false
    ) {
        self.id = UUID()
        self.name = name
        self.version = version
        self.category = category
        self.latestVersion = latestVersion
        self.releaseDate = releaseDate
        self.description = description
        self.criticalUpdate = criticalUpdate
    }

    var status: SoftwareStatus {
        if criticalUpdate {
            return .critical
        }
        if version == latestVersion {
            return .upToDate
        }

        let currentParts = version.split(separator: ".").compactMap { Int($0) }
        let latestParts = latestVersion.split(separator: ".").compactMap { Int($0) }

        guard !currentParts.isEmpty, !latestParts.isEmpty else {
            return .unknown
        }

        if currentParts.lexicographicallyPrecedes(latestParts) {
            if latestParts[0] - currentParts[0] > 1 {
                return .outdated
            }
            return .updateAvailable
        }

        return .unknown
    }

    var needsUpdate: Bool {
        let s = status
        return s == .updateAvailable || s == .outdated || s == .critical
    }
}
