import Foundation

// MARK: - Enumeraciones

enum SoftwareCategory: String, CaseIterable, Identifiable {
    case ecu = "ECU"
    case adas = "ADAS"
    case infotainment = "Infotainment"
    case transmission = "Transmision"
    case abs = "ABS"
    case airbag = "Airbag"
    case climate = "Climatizacion"
    case body = "Carroceria"
    case bms = "BMS"
    case connectivity = "Conectividad"

    var id: String { rawValue }

    var icon: String {
        switch self {
        case .ecu: return "engine.combustion"
        case .adas: return "car.rear.and.tire.marks"
        case .infotainment: return "music.note.tv"
        case .transmission: return "gearshape.2"
        case .abs: return "brake.signal"
        case .airbag: return "shield.checkered"
        case .climate: return "thermometer.medium"
        case .body: return "car.side"
        case .bms: return "battery.100.bolt"
        case .connectivity: return "wifi"
        }
    }
}

enum SoftwareStatus: String, CaseIterable, Identifiable {
    case upToDate = "Actualizado"
    case updateAvailable = "Actualizacion Disponible"
    case outdated = "Desactualizado"
    case critical = "Actualizacion Critica"

    var id: String { rawValue }

    var icon: String {
        switch self {
        case .upToDate: return "checkmark.circle.fill"
        case .updateAvailable: return "exclamationmark.triangle.fill"
        case .outdated: return "bolt.fill"
        case .critical: return "xmark.octagon.fill"
        }
    }

    var color: String {
        switch self {
        case .upToDate: return "StatusGreen"
        case .updateAvailable: return "StatusYellow"
        case .outdated: return "StatusOrange"
        case .critical: return "StatusRed"
        }
    }
}

// MARK: - Modelos de datos

struct VehicleSoftware: Identifiable {
    let id = UUID()
    let name: String
    let category: SoftwareCategory
    let currentVersion: String
    let latestVersion: String
    let status: SoftwareStatus
}

struct VehicleModel: Identifiable {
    let id = UUID()
    let name: String
    let year: Int
    let software: [VehicleSoftware]
}

struct VehicleBrand: Identifiable {
    let id = UUID()
    let name: String
    let country: String
    let models: [VehicleModel]

    var modelNames: [String] {
        models.map { $0.name }
    }
}

// MARK: - Resultado del escaneo

struct ScanResult: Identifiable {
    let id = UUID()
    let brand: String
    let model: String
    let country: String
    let software: [VehicleSoftware]

    var totalSoftware: Int { software.count }

    var upToDate: Int {
        software.filter { $0.status == .upToDate }.count
    }

    var updateAvailable: Int {
        software.filter { $0.status == .updateAvailable }.count
    }

    var outdated: Int {
        software.filter { $0.status == .outdated }.count
    }

    var critical: Int {
        software.filter { $0.status == .critical }.count
    }
}

// MARK: - Blog

struct BlogPost: Identifiable {
    let id = UUID()
    let title: String
    let summary: String
    let content: String
    let date: Date
    let category: String
    let imageSystemName: String
}
