import Foundation

struct VehicleModel: Identifiable, Codable {
    let id: UUID
    let name: String
    let yearStart: Int
    let yearEnd: Int?
    var softwareList: [VehicleSoftware]

    init(name: String, yearStart: Int, yearEnd: Int? = nil, softwareList: [VehicleSoftware] = []) {
        self.id = UUID()
        self.name = name
        self.yearStart = yearStart
        self.yearEnd = yearEnd
        self.softwareList = softwareList
    }

    var yearRange: String {
        if let end = yearEnd {
            return "\(yearStart)-\(end)"
        }
        return "\(yearStart)-presente"
    }

    var displayName: String {
        "\(name) (\(yearRange))"
    }
}
