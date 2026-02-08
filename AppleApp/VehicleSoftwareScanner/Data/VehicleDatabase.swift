import Foundation

struct VehicleDatabase {

    static func initializeScanner() -> VehicleSoftwareScannerEngine {
        let scanner = VehicleSoftwareScannerEngine()
        scanner.addBrand(createToyota())
        scanner.addBrand(createVolkswagen())
        scanner.addBrand(createFord())
        scanner.addBrand(createBMW())
        scanner.addBrand(createHyundai())
        scanner.addBrand(createMercedes())
        return scanner
    }

    // MARK: - Toyota

    static func createToyota() -> VehicleBrand {
        let corolla = VehicleModel(
            name: "Corolla",
            yearStart: 2019,
            yearEnd: 2024,
            softwareList: [
                VehicleSoftware(
                    name: "Toyota ECU-M",
                    version: "3.2.1",
                    category: .ecu,
                    latestVersion: "3.4.0",
                    releaseDate: "2024-06-15",
                    description: "Unidad de control del motor principal"
                ),
                VehicleSoftware(
                    name: "Entune 3.0",
                    version: "2.8.5",
                    category: .infotainment,
                    latestVersion: "3.1.2",
                    releaseDate: "2024-09-01",
                    description: "Sistema multimedia y navegacion"
                ),
                VehicleSoftware(
                    name: "Toyota Safety Sense 2.5",
                    version: "2.5.0",
                    category: .adas,
                    latestVersion: "2.5.0",
                    releaseDate: "2024-01-10",
                    description: "Sistema de asistencia de seguridad"
                ),
                VehicleSoftware(
                    name: "ABS Controller",
                    version: "1.4.2",
                    category: .abs,
                    latestVersion: "1.5.0",
                    releaseDate: "2024-03-20",
                    description: "Control del sistema de frenos ABS",
                    criticalUpdate: true
                ),
                VehicleSoftware(
                    name: "Climate Control Module",
                    version: "2.1.0",
                    category: .climate,
                    latestVersion: "2.1.0",
                    releaseDate: "2023-11-05",
                    description: "Control de climatizacion automatica"
                ),
            ]
        )

        let rav4 = VehicleModel(
            name: "RAV4",
            yearStart: 2020,
            softwareList: [
                VehicleSoftware(
                    name: "Toyota ECU-H",
                    version: "4.0.2",
                    category: .ecu,
                    latestVersion: "4.1.0",
                    releaseDate: "2024-08-20",
                    description: "ECU para motor hibrido"
                ),
                VehicleSoftware(
                    name: "Toyota Connected Services",
                    version: "5.2.1",
                    category: .connectivity,
                    latestVersion: "5.3.0",
                    releaseDate: "2024-10-01",
                    description: "Servicios de conectividad y telematica"
                ),
                VehicleSoftware(
                    name: "Toyota Safety Sense 2.5+",
                    version: "2.6.1",
                    category: .adas,
                    latestVersion: "2.6.1",
                    releaseDate: "2024-07-15",
                    description: "Sistema ADAS avanzado"
                ),
                VehicleSoftware(
                    name: "Hybrid Battery Manager",
                    version: "3.0.5",
                    category: .battery,
                    latestVersion: "3.1.2",
                    releaseDate: "2024-09-10",
                    description: "Gestion de bateria hibrida"
                ),
            ]
        )

        let camry = VehicleModel(
            name: "Camry",
            yearStart: 2018,
            yearEnd: 2024,
            softwareList: [
                VehicleSoftware(
                    name: "Toyota ECU-S",
                    version: "2.9.0",
                    category: .ecu,
                    latestVersion: "3.0.0",
                    releaseDate: "2024-05-01",
                    description: "ECU sedan premium"
                ),
                VehicleSoftware(
                    name: "JBL Audio System",
                    version: "4.5.2",
                    category: .infotainment,
                    latestVersion: "4.5.2",
                    releaseDate: "2024-02-28",
                    description: "Sistema de audio premium JBL"
                ),
                VehicleSoftware(
                    name: "Transmission Controller",
                    version: "1.8.0",
                    category: .transmission,
                    latestVersion: "2.0.0",
                    releaseDate: "2024-04-15",
                    description: "Control de transmision automatica"
                ),
            ]
        )

        return VehicleBrand(name: "Toyota", country: "Japon", models: [corolla, rav4, camry])
    }

    // MARK: - Volkswagen

    static func createVolkswagen() -> VehicleBrand {
        let golf = VehicleModel(
            name: "Golf",
            yearStart: 2020,
            softwareList: [
                VehicleSoftware(
                    name: "MIB3 Infotainment",
                    version: "3.2.1",
                    category: .infotainment,
                    latestVersion: "3.4.0",
                    releaseDate: "2024-11-01",
                    description: "Sistema MIB3 con pantalla tactil"
                ),
                VehicleSoftware(
                    name: "EA211 ECU",
                    version: "5.4.2",
                    category: .ecu,
                    latestVersion: "5.5.0",
                    releaseDate: "2024-08-15",
                    description: "Control motor TSI 1.4/1.5"
                ),
                VehicleSoftware(
                    name: "IQ.DRIVE",
                    version: "2.1.0",
                    category: .adas,
                    latestVersion: "2.3.0",
                    releaseDate: "2024-09-20",
                    description: "Sistema de asistencia a la conduccion",
                    criticalUpdate: true
                ),
                VehicleSoftware(
                    name: "DSG Controller",
                    version: "4.2.1",
                    category: .transmission,
                    latestVersion: "4.2.1",
                    releaseDate: "2024-03-10",
                    description: "Control caja DSG de doble embrague"
                ),
                VehicleSoftware(
                    name: "We Connect",
                    version: "2.5.0",
                    category: .connectivity,
                    latestVersion: "2.6.1",
                    releaseDate: "2024-10-05",
                    description: "Servicios conectados Volkswagen"
                ),
            ]
        )

        let tiguan = VehicleModel(
            name: "Tiguan",
            yearStart: 2019,
            softwareList: [
                VehicleSoftware(
                    name: "MIB3 Pro",
                    version: "3.3.0",
                    category: .infotainment,
                    latestVersion: "3.4.0",
                    releaseDate: "2024-11-01",
                    description: "Sistema multimedia premium"
                ),
                VehicleSoftware(
                    name: "EA888 ECU",
                    version: "6.1.2",
                    category: .ecu,
                    latestVersion: "6.2.0",
                    releaseDate: "2024-07-20",
                    description: "Control motor TSI 2.0"
                ),
                VehicleSoftware(
                    name: "4Motion Controller",
                    version: "3.0.5",
                    category: .transmission,
                    latestVersion: "3.0.5",
                    releaseDate: "2024-01-15",
                    description: "Control traccion integral"
                ),
                VehicleSoftware(
                    name: "Park Assist",
                    version: "2.4.0",
                    category: .adas,
                    latestVersion: "2.5.0",
                    releaseDate: "2024-06-01",
                    description: "Asistente de aparcamiento automatico"
                ),
            ]
        )

        let id4 = VehicleModel(
            name: "ID.4",
            yearStart: 2021,
            softwareList: [
                VehicleSoftware(
                    name: "VW.OS",
                    version: "3.0.0",
                    category: .ecu,
                    latestVersion: "3.2.0",
                    releaseDate: "2024-10-15",
                    description: "Sistema operativo del vehiculo electrico"
                ),
                VehicleSoftware(
                    name: "ID. Software",
                    version: "3.1.0",
                    category: .infotainment,
                    latestVersion: "3.3.0",
                    releaseDate: "2024-11-10",
                    description: "Interfaz de usuario ID."
                ),
                VehicleSoftware(
                    name: "BMS Pro",
                    version: "2.5.1",
                    category: .battery,
                    latestVersion: "2.6.0",
                    releaseDate: "2024-09-25",
                    description: "Gestion de bateria de alto voltaje"
                ),
                VehicleSoftware(
                    name: "ID. Pilot",
                    version: "1.8.0",
                    category: .adas,
                    latestVersion: "2.0.0",
                    releaseDate: "2024-08-01",
                    description: "Sistema de conduccion semi-autonoma",
                    criticalUpdate: true
                ),
            ]
        )

        return VehicleBrand(name: "Volkswagen", country: "Alemania", models: [golf, tiguan, id4])
    }

    // MARK: - Ford

    static func createFord() -> VehicleBrand {
        let mustang = VehicleModel(
            name: "Mustang",
            yearStart: 2018,
            softwareList: [
                VehicleSoftware(
                    name: "SYNC 4",
                    version: "4.1.2",
                    category: .infotainment,
                    latestVersion: "4.2.0",
                    releaseDate: "2024-09-15",
                    description: "Sistema SYNC 4 con pantalla de 12 pulgadas"
                ),
                VehicleSoftware(
                    name: "Coyote V8 ECU",
                    version: "7.2.0",
                    category: .ecu,
                    latestVersion: "7.2.0",
                    releaseDate: "2024-05-20",
                    description: "Control motor V8 5.0L"
                ),
                VehicleSoftware(
                    name: "MagneRide",
                    version: "3.1.0",
                    category: .body,
                    latestVersion: "3.2.0",
                    releaseDate: "2024-07-10",
                    description: "Control de suspension adaptativa"
                ),
                VehicleSoftware(
                    name: "Track Apps",
                    version: "2.3.1",
                    category: .infotainment,
                    latestVersion: "2.4.0",
                    releaseDate: "2024-06-01",
                    description: "Aplicaciones de rendimiento en pista"
                ),
            ]
        )

        let f150 = VehicleModel(
            name: "F-150",
            yearStart: 2021,
            softwareList: [
                VehicleSoftware(
                    name: "SYNC 4A",
                    version: "4.2.0",
                    category: .infotainment,
                    latestVersion: "4.2.0",
                    releaseDate: "2024-10-01",
                    description: "Sistema SYNC 4A con pantalla de 15.5 pulgadas"
                ),
                VehicleSoftware(
                    name: "PowerBoost ECU",
                    version: "2.8.1",
                    category: .ecu,
                    latestVersion: "2.9.0",
                    releaseDate: "2024-08-25",
                    description: "Control motor hibrido PowerBoost"
                ),
                VehicleSoftware(
                    name: "Pro Trailer Backup",
                    version: "1.5.0",
                    category: .adas,
                    latestVersion: "1.6.0",
                    releaseDate: "2024-04-15",
                    description: "Asistente de reversa con remolque"
                ),
                VehicleSoftware(
                    name: "FordPass Connect",
                    version: "3.4.2",
                    category: .connectivity,
                    latestVersion: "3.5.0",
                    releaseDate: "2024-09-10",
                    description: "Modulo de conectividad FordPass"
                ),
                VehicleSoftware(
                    name: "Onboard Scales",
                    version: "1.2.0",
                    category: .body,
                    latestVersion: "1.2.0",
                    releaseDate: "2024-02-20",
                    description: "Sistema de pesaje integrado"
                ),
            ]
        )

        let machE = VehicleModel(
            name: "Mustang Mach-E",
            yearStart: 2021,
            softwareList: [
                VehicleSoftware(
                    name: "SYNC 4A EV",
                    version: "4.3.0",
                    category: .infotainment,
                    latestVersion: "4.4.0",
                    releaseDate: "2024-11-05",
                    description: "SYNC optimizado para vehiculos electricos"
                ),
                VehicleSoftware(
                    name: "Mach-E Drive Module",
                    version: "3.2.1",
                    category: .ecu,
                    latestVersion: "3.3.0",
                    releaseDate: "2024-10-20",
                    description: "Control de motor electrico"
                ),
                VehicleSoftware(
                    name: "BlueCruise",
                    version: "1.2.0",
                    category: .adas,
                    latestVersion: "1.4.0",
                    releaseDate: "2024-09-01",
                    description: "Sistema de conduccion manos libres",
                    criticalUpdate: true
                ),
                VehicleSoftware(
                    name: "Battery Thermal Manager",
                    version: "2.1.5",
                    category: .battery,
                    latestVersion: "2.2.0",
                    releaseDate: "2024-08-15",
                    description: "Gestion termica de bateria"
                ),
            ]
        )

        return VehicleBrand(name: "Ford", country: "Estados Unidos", models: [mustang, f150, machE])
    }

    // MARK: - BMW

    static func createBMW() -> VehicleBrand {
        let serie3 = VehicleModel(
            name: "Serie 3",
            yearStart: 2019,
            softwareList: [
                VehicleSoftware(
                    name: "iDrive 8",
                    version: "8.2.0",
                    category: .infotainment,
                    latestVersion: "8.3.0",
                    releaseDate: "2024-10-15",
                    description: "Sistema iDrive con pantalla curva"
                ),
                VehicleSoftware(
                    name: "B48 DME",
                    version: "4.5.2",
                    category: .ecu,
                    latestVersion: "4.6.0",
                    releaseDate: "2024-07-20",
                    description: "Control motor 4 cilindros turbo"
                ),
                VehicleSoftware(
                    name: "Driving Assistant Pro",
                    version: "3.1.0",
                    category: .adas,
                    latestVersion: "3.2.0",
                    releaseDate: "2024-08-10",
                    description: "Asistente de conduccion profesional"
                ),
                VehicleSoftware(
                    name: "Steptronic ZF",
                    version: "2.8.1",
                    category: .transmission,
                    latestVersion: "2.8.1",
                    releaseDate: "2024-04-05",
                    description: "Control transmision automatica 8 velocidades"
                ),
                VehicleSoftware(
                    name: "BMW Connected Drive",
                    version: "5.4.0",
                    category: .connectivity,
                    latestVersion: "5.5.0",
                    releaseDate: "2024-09-20",
                    description: "Servicios conectados BMW"
                ),
            ]
        )

        let x5 = VehicleModel(
            name: "X5",
            yearStart: 2019,
            softwareList: [
                VehicleSoftware(
                    name: "iDrive 8.5",
                    version: "8.5.0",
                    category: .infotainment,
                    latestVersion: "8.5.0",
                    releaseDate: "2024-11-01",
                    description: "iDrive premium para SUV"
                ),
                VehicleSoftware(
                    name: "B58 DME",
                    version: "5.2.1",
                    category: .ecu,
                    latestVersion: "5.3.0",
                    releaseDate: "2024-09-15",
                    description: "Control motor 6 cilindros en linea"
                ),
                VehicleSoftware(
                    name: "xDrive Controller",
                    version: "4.1.0",
                    category: .transmission,
                    latestVersion: "4.1.0",
                    releaseDate: "2024-06-20",
                    description: "Control traccion integral inteligente"
                ),
                VehicleSoftware(
                    name: "Air Suspension",
                    version: "2.3.0",
                    category: .body,
                    latestVersion: "2.4.0",
                    releaseDate: "2024-05-10",
                    description: "Control suspension neumatica"
                ),
            ]
        )

        let ix = VehicleModel(
            name: "iX",
            yearStart: 2022,
            softwareList: [
                VehicleSoftware(
                    name: "iDrive 9",
                    version: "9.0.0",
                    category: .infotainment,
                    latestVersion: "9.1.0",
                    releaseDate: "2024-10-25",
                    description: "iDrive de nueva generacion"
                ),
                VehicleSoftware(
                    name: "eDrive Control",
                    version: "2.4.0",
                    category: .ecu,
                    latestVersion: "2.5.0",
                    releaseDate: "2024-09-05",
                    description: "Control de motores electricos"
                ),
                VehicleSoftware(
                    name: "BMW Intelligent Personal Assistant",
                    version: "3.0.0",
                    category: .infotainment,
                    latestVersion: "3.1.0",
                    releaseDate: "2024-08-20",
                    description: "Asistente de voz con IA"
                ),
                VehicleSoftware(
                    name: "High-Voltage BMS",
                    version: "1.8.0",
                    category: .battery,
                    latestVersion: "2.0.0",
                    releaseDate: "2024-11-10",
                    description: "Gestion de bateria de alto voltaje",
                    criticalUpdate: true
                ),
            ]
        )

        return VehicleBrand(name: "BMW", country: "Alemania", models: [serie3, x5, ix])
    }

    // MARK: - Hyundai

    static func createHyundai() -> VehicleBrand {
        let tucson = VehicleModel(
            name: "Tucson",
            yearStart: 2021,
            softwareList: [
                VehicleSoftware(
                    name: "Bluelink",
                    version: "4.2.0",
                    category: .connectivity,
                    latestVersion: "4.3.0",
                    releaseDate: "2024-09-15",
                    description: "Sistema de conectividad Bluelink"
                ),
                VehicleSoftware(
                    name: "Smartstream ECU",
                    version: "3.1.2",
                    category: .ecu,
                    latestVersion: "3.2.0",
                    releaseDate: "2024-08-10",
                    description: "Control motor Smartstream"
                ),
                VehicleSoftware(
                    name: "SmartSense",
                    version: "2.5.0",
                    category: .adas,
                    latestVersion: "2.5.0",
                    releaseDate: "2024-06-20",
                    description: "Sistema de seguridad SmartSense"
                ),
                VehicleSoftware(
                    name: "DCT Controller",
                    version: "2.2.1",
                    category: .transmission,
                    latestVersion: "2.3.0",
                    releaseDate: "2024-07-05",
                    description: "Control caja de doble embrague"
                ),
            ]
        )

        let ioniq5 = VehicleModel(
            name: "IONIQ 5",
            yearStart: 2022,
            softwareList: [
                VehicleSoftware(
                    name: "E-GMP ECU",
                    version: "2.8.0",
                    category: .ecu,
                    latestVersion: "3.0.0",
                    releaseDate: "2024-10-20",
                    description: "Control plataforma E-GMP"
                ),
                VehicleSoftware(
                    name: "ccNC Navigation",
                    version: "5.1.0",
                    category: .infotainment,
                    latestVersion: "5.2.0",
                    releaseDate: "2024-09-01",
                    description: "Sistema de navegacion conectada"
                ),
                VehicleSoftware(
                    name: "V2L Controller",
                    version: "1.5.0",
                    category: .battery,
                    latestVersion: "1.6.0",
                    releaseDate: "2024-08-15",
                    description: "Control Vehicle-to-Load"
                ),
                VehicleSoftware(
                    name: "Highway Driving Assist 2",
                    version: "2.1.0",
                    category: .adas,
                    latestVersion: "2.2.0",
                    releaseDate: "2024-07-25",
                    description: "Asistente de conduccion en autopista"
                ),
                VehicleSoftware(
                    name: "Battery Preconditioning",
                    version: "1.3.0",
                    category: .battery,
                    latestVersion: "1.4.0",
                    releaseDate: "2024-06-10",
                    description: "Preacondicionamiento de bateria para carga"
                ),
            ]
        )

        return VehicleBrand(name: "Hyundai", country: "Corea del Sur", models: [tucson, ioniq5])
    }

    // MARK: - Mercedes-Benz

    static func createMercedes() -> VehicleBrand {
        let claseC = VehicleModel(
            name: "Clase C",
            yearStart: 2022,
            softwareList: [
                VehicleSoftware(
                    name: "MBUX 2.0",
                    version: "2.5.0",
                    category: .infotainment,
                    latestVersion: "2.6.0",
                    releaseDate: "2024-10-10",
                    description: "Sistema multimedia MBUX segunda generacion"
                ),
                VehicleSoftware(
                    name: "M254 ECU",
                    version: "3.2.1",
                    category: .ecu,
                    latestVersion: "3.3.0",
                    releaseDate: "2024-08-20",
                    description: "Control motor 4 cilindros mild-hybrid"
                ),
                VehicleSoftware(
                    name: "Driver Assistance Package",
                    version: "4.1.0",
                    category: .adas,
                    latestVersion: "4.2.0",
                    releaseDate: "2024-09-05",
                    description: "Paquete de asistencia al conductor"
                ),
                VehicleSoftware(
                    name: "9G-TRONIC",
                    version: "2.8.0",
                    category: .transmission,
                    latestVersion: "2.8.0",
                    releaseDate: "2024-05-15",
                    description: "Control transmision 9 velocidades"
                ),
                VehicleSoftware(
                    name: "Mercedes me connect",
                    version: "6.2.0",
                    category: .connectivity,
                    latestVersion: "6.3.0",
                    releaseDate: "2024-10-25",
                    description: "Servicios conectados Mercedes"
                ),
            ]
        )

        let eqs = VehicleModel(
            name: "EQS",
            yearStart: 2022,
            softwareList: [
                VehicleSoftware(
                    name: "MBUX Hyperscreen",
                    version: "3.0.0",
                    category: .infotainment,
                    latestVersion: "3.2.0",
                    releaseDate: "2024-11-01",
                    description: "Sistema MBUX con pantalla de 56 pulgadas"
                ),
                VehicleSoftware(
                    name: "eATS Control",
                    version: "2.5.0",
                    category: .ecu,
                    latestVersion: "2.6.0",
                    releaseDate: "2024-09-20",
                    description: "Control del tren motriz electrico"
                ),
                VehicleSoftware(
                    name: "DRIVE PILOT",
                    version: "1.5.0",
                    category: .adas,
                    latestVersion: "2.0.0",
                    releaseDate: "2024-10-15",
                    description: "Conduccion autonoma nivel 3",
                    criticalUpdate: true
                ),
                VehicleSoftware(
                    name: "Intelligent Range Manager",
                    version: "1.8.0",
                    category: .battery,
                    latestVersion: "1.9.0",
                    releaseDate: "2024-08-10",
                    description: "Gestion inteligente de autonomia"
                ),
                VehicleSoftware(
                    name: "AIRMATIC",
                    version: "3.2.0",
                    category: .body,
                    latestVersion: "3.2.0",
                    releaseDate: "2024-06-25",
                    description: "Suspension neumatica adaptativa"
                ),
            ]
        )

        return VehicleBrand(name: "Mercedes-Benz", country: "Alemania", models: [claseC, eqs])
    }
}
