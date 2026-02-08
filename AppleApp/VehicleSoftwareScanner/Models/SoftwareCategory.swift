import Foundation

enum SoftwareCategory: String, CaseIterable, Identifiable, Codable {
    case ecu = "ECU (Unidad de Control del Motor)"
    case infotainment = "Sistema de Infoentretenimiento"
    case adas = "ADAS (Asistencia Avanzada al Conductor)"
    case transmission = "Control de Transmision"
    case abs = "Sistema ABS/Frenos"
    case airbag = "Sistema de Airbags"
    case climate = "Control de Climatizacion"
    case body = "Modulo de Carroceria"
    case battery = "Gestion de Bateria (BMS)"
    case connectivity = "Conectividad/Telematica"

    var id: String { rawValue }

    var icon: String {
        switch self {
        case .ecu: return "engine.combustion"
        case .infotainment: return "play.display"
        case .adas: return "car.side.front.open"
        case .transmission: return "gearshape.2"
        case .abs: return "brake.signal"
        case .airbag: return "airbag"
        case .climate: return "thermometer.snowflake"
        case .body: return "car.top.door.front.left.open"
        case .battery: return "battery.100.bolt"
        case .connectivity: return "wifi"
        }
    }

    var shortName: String {
        switch self {
        case .ecu: return "ECU"
        case .infotainment: return "Infoentretenimiento"
        case .adas: return "ADAS"
        case .transmission: return "Transmision"
        case .abs: return "ABS"
        case .airbag: return "Airbags"
        case .climate: return "Climatizacion"
        case .body: return "Carroceria"
        case .battery: return "Bateria"
        case .connectivity: return "Conectividad"
        }
    }
}
