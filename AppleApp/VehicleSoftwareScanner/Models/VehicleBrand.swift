import Foundation

struct VehicleBrand: Identifiable, Codable {
    let id: UUID
    let name: String
    let country: String
    var models: [VehicleModel]

    init(name: String, country: String, models: [VehicleModel] = []) {
        self.id = UUID()
        self.name = name
        self.country = country
        self.models = models
    }

    func getModel(named modelName: String) -> VehicleModel? {
        models.first { $0.name.lowercased() == modelName.lowercased() }
    }

    var flagEmoji: String {
        switch country {
        case "Japon": return "🇯🇵"
        case "Alemania": return "🇩🇪"
        case "Estados Unidos": return "🇺🇸"
        case "Corea del Sur": return "🇰🇷"
        default: return "🏳️"
        }
    }
}
