import SwiftUI

enum SoftwareStatus: String, Codable {
    case upToDate = "Actualizado"
    case updateAvailable = "Actualizacion Disponible"
    case outdated = "Desactualizado"
    case critical = "Actualizacion Critica"
    case unknown = "Desconocido"

    var color: Color {
        switch self {
        case .upToDate: return .green
        case .updateAvailable: return .orange
        case .outdated: return .red
        case .critical: return .red
        case .unknown: return .gray
        }
    }

    var icon: String {
        switch self {
        case .upToDate: return "checkmark.circle.fill"
        case .updateAvailable: return "exclamationmark.triangle.fill"
        case .outdated: return "xmark.circle.fill"
        case .critical: return "bolt.trianglebadge.exclamationmark.fill"
        case .unknown: return "questionmark.circle.fill"
        }
    }
}
