import Foundation

// MARK: - Base de datos de vehiculos

struct VehicleDatabase {

    static let brands: [VehicleBrand] = [
        // MARK: Toyota
        VehicleBrand(name: "Toyota", country: "Japon", models: [
            VehicleModel(name: "Corolla", year: 2024, software: [
                VehicleSoftware(name: "ECU Principal", category: .ecu, currentVersion: "3.2.1", latestVersion: "3.2.1", status: .upToDate),
                VehicleSoftware(name: "Toyota Safety Sense", category: .adas, currentVersion: "2.1.0", latestVersion: "2.3.0", status: .updateAvailable),
                VehicleSoftware(name: "Entune Audio", category: .infotainment, currentVersion: "4.0.2", latestVersion: "4.1.0", status: .updateAvailable),
                VehicleSoftware(name: "CVT Control", category: .transmission, currentVersion: "1.8.0", latestVersion: "1.8.0", status: .upToDate),
                VehicleSoftware(name: "ABS Module", category: .abs, currentVersion: "2.0.1", latestVersion: "2.0.1", status: .upToDate),
                VehicleSoftware(name: "SRS Airbag", category: .airbag, currentVersion: "1.5.0", latestVersion: "1.7.0", status: .critical),
            ]),
            VehicleModel(name: "RAV4", year: 2024, software: [
                VehicleSoftware(name: "ECU Motor Hibrido", category: .ecu, currentVersion: "4.1.0", latestVersion: "4.2.0", status: .updateAvailable),
                VehicleSoftware(name: "Toyota Safety Sense 3.0", category: .adas, currentVersion: "3.0.0", latestVersion: "3.0.0", status: .upToDate),
                VehicleSoftware(name: "Audio Plus", category: .infotainment, currentVersion: "5.2.1", latestVersion: "5.2.1", status: .upToDate),
                VehicleSoftware(name: "E-CVT Hibrido", category: .transmission, currentVersion: "2.3.0", latestVersion: "2.3.0", status: .upToDate),
                VehicleSoftware(name: "Climatizacion Auto", category: .climate, currentVersion: "1.2.0", latestVersion: "1.4.0", status: .outdated),
                VehicleSoftware(name: "BMS Hibrido", category: .bms, currentVersion: "3.0.1", latestVersion: "3.1.0", status: .updateAvailable),
            ]),
            VehicleModel(name: "Camry", year: 2024, software: [
                VehicleSoftware(name: "ECU V6", category: .ecu, currentVersion: "5.0.0", latestVersion: "5.0.0", status: .upToDate),
                VehicleSoftware(name: "Pre-Collision System", category: .adas, currentVersion: "2.8.0", latestVersion: "3.0.0", status: .outdated),
                VehicleSoftware(name: "JBL Premium Audio", category: .infotainment, currentVersion: "6.1.0", latestVersion: "6.1.0", status: .upToDate),
                VehicleSoftware(name: "Auto Transmision 8AT", category: .transmission, currentVersion: "3.1.0", latestVersion: "3.1.0", status: .upToDate),
                VehicleSoftware(name: "Body Control Module", category: .body, currentVersion: "2.0.0", latestVersion: "2.1.0", status: .updateAvailable),
            ]),
        ]),

        // MARK: Volkswagen
        VehicleBrand(name: "Volkswagen", country: "Alemania", models: [
            VehicleModel(name: "Golf", year: 2024, software: [
                VehicleSoftware(name: "ECU TSI", category: .ecu, currentVersion: "4.5.0", latestVersion: "4.5.0", status: .upToDate),
                VehicleSoftware(name: "IQ.DRIVE", category: .adas, currentVersion: "2.0.0", latestVersion: "2.2.0", status: .updateAvailable),
                VehicleSoftware(name: "Discover Pro", category: .infotainment, currentVersion: "3.1.0", latestVersion: "3.5.0", status: .outdated),
                VehicleSoftware(name: "DSG Control", category: .transmission, currentVersion: "5.0.1", latestVersion: "5.0.1", status: .upToDate),
                VehicleSoftware(name: "ESP/ABS Module", category: .abs, currentVersion: "3.2.0", latestVersion: "3.2.0", status: .upToDate),
            ]),
            VehicleModel(name: "Tiguan", year: 2024, software: [
                VehicleSoftware(name: "ECU 2.0 TSI", category: .ecu, currentVersion: "4.8.0", latestVersion: "5.0.0", status: .outdated),
                VehicleSoftware(name: "Travel Assist", category: .adas, currentVersion: "1.5.0", latestVersion: "2.0.0", status: .critical),
                VehicleSoftware(name: "Discover Media", category: .infotainment, currentVersion: "4.2.0", latestVersion: "4.2.0", status: .upToDate),
                VehicleSoftware(name: "4Motion AWD", category: .transmission, currentVersion: "2.1.0", latestVersion: "2.1.0", status: .upToDate),
                VehicleSoftware(name: "Climatronic", category: .climate, currentVersion: "1.8.0", latestVersion: "2.0.0", status: .outdated),
            ]),
            VehicleModel(name: "ID.4", year: 2024, software: [
                VehicleSoftware(name: "Motor Electrico Control", category: .ecu, currentVersion: "3.0.0", latestVersion: "3.2.0", status: .updateAvailable),
                VehicleSoftware(name: "IQ.DRIVE Pro", category: .adas, currentVersion: "2.5.0", latestVersion: "2.5.0", status: .upToDate),
                VehicleSoftware(name: "ID. Software", category: .infotainment, currentVersion: "3.2.0", latestVersion: "4.0.0", status: .critical),
                VehicleSoftware(name: "Reduccion 1 vel", category: .transmission, currentVersion: "1.0.0", latestVersion: "1.0.0", status: .upToDate),
                VehicleSoftware(name: "BMS Alta Tension", category: .bms, currentVersion: "2.8.0", latestVersion: "3.0.0", status: .critical),
                VehicleSoftware(name: "Conectividad OTA", category: .connectivity, currentVersion: "1.5.0", latestVersion: "2.0.0", status: .outdated),
            ]),
        ]),

        // MARK: Ford
        VehicleBrand(name: "Ford", country: "Estados Unidos", models: [
            VehicleModel(name: "Mustang", year: 2024, software: [
                VehicleSoftware(name: "ECU Coyote V8", category: .ecu, currentVersion: "6.0.0", latestVersion: "6.0.0", status: .upToDate),
                VehicleSoftware(name: "Co-Pilot360", category: .adas, currentVersion: "2.0.0", latestVersion: "2.1.0", status: .updateAvailable),
                VehicleSoftware(name: "SYNC 4", category: .infotainment, currentVersion: "4.0.0", latestVersion: "4.2.0", status: .updateAvailable),
                VehicleSoftware(name: "10R80 Auto", category: .transmission, currentVersion: "3.5.0", latestVersion: "3.5.0", status: .upToDate),
                VehicleSoftware(name: "MagneRide", category: .body, currentVersion: "2.0.0", latestVersion: "2.0.0", status: .upToDate),
            ]),
            VehicleModel(name: "F-150", year: 2024, software: [
                VehicleSoftware(name: "ECU EcoBoost", category: .ecu, currentVersion: "5.5.0", latestVersion: "5.5.0", status: .upToDate),
                VehicleSoftware(name: "Pro Trailer Assist", category: .adas, currentVersion: "3.0.0", latestVersion: "3.0.0", status: .upToDate),
                VehicleSoftware(name: "SYNC 4A", category: .infotainment, currentVersion: "4.5.0", latestVersion: "5.0.0", status: .outdated),
                VehicleSoftware(name: "10R80 HD", category: .transmission, currentVersion: "4.0.0", latestVersion: "4.0.0", status: .upToDate),
                VehicleSoftware(name: "Trailer Control", category: .body, currentVersion: "1.5.0", latestVersion: "1.8.0", status: .updateAvailable),
            ]),
            VehicleModel(name: "Mustang Mach-E", year: 2024, software: [
                VehicleSoftware(name: "Motor Electrico Dual", category: .ecu, currentVersion: "3.5.0", latestVersion: "4.0.0", status: .outdated),
                VehicleSoftware(name: "BlueCruise", category: .adas, currentVersion: "1.2.0", latestVersion: "2.0.0", status: .critical),
                VehicleSoftware(name: "SYNC 4A EV", category: .infotainment, currentVersion: "5.0.0", latestVersion: "5.0.0", status: .upToDate),
                VehicleSoftware(name: "BMS Extended Range", category: .bms, currentVersion: "2.5.0", latestVersion: "3.0.0", status: .critical),
                VehicleSoftware(name: "FordPass Connect", category: .connectivity, currentVersion: "3.0.0", latestVersion: "3.2.0", status: .updateAvailable),
            ]),
        ]),

        // MARK: BMW
        VehicleBrand(name: "BMW", country: "Alemania", models: [
            VehicleModel(name: "Serie 3", year: 2024, software: [
                VehicleSoftware(name: "DME B48", category: .ecu, currentVersion: "7.0.0", latestVersion: "7.0.0", status: .upToDate),
                VehicleSoftware(name: "Driving Assistant Pro", category: .adas, currentVersion: "3.0.0", latestVersion: "3.1.0", status: .updateAvailable),
                VehicleSoftware(name: "iDrive 8.5", category: .infotainment, currentVersion: "8.5.0", latestVersion: "8.5.0", status: .upToDate),
                VehicleSoftware(name: "Steptronic 8HP", category: .transmission, currentVersion: "4.2.0", latestVersion: "4.2.0", status: .upToDate),
                VehicleSoftware(name: "Active Guard", category: .abs, currentVersion: "2.5.0", latestVersion: "2.5.0", status: .upToDate),
                VehicleSoftware(name: "ConnectedDrive", category: .connectivity, currentVersion: "5.0.0", latestVersion: "5.2.0", status: .updateAvailable),
            ]),
            VehicleModel(name: "X5", year: 2024, software: [
                VehicleSoftware(name: "DME B58", category: .ecu, currentVersion: "6.8.0", latestVersion: "7.0.0", status: .outdated),
                VehicleSoftware(name: "Driving Assistant Pro Plus", category: .adas, currentVersion: "3.5.0", latestVersion: "3.5.0", status: .upToDate),
                VehicleSoftware(name: "iDrive 9", category: .infotainment, currentVersion: "9.0.0", latestVersion: "9.0.0", status: .upToDate),
                VehicleSoftware(name: "xDrive AWD", category: .transmission, currentVersion: "5.0.0", latestVersion: "5.0.0", status: .upToDate),
                VehicleSoftware(name: "Air Suspension", category: .body, currentVersion: "2.0.0", latestVersion: "2.3.0", status: .updateAvailable),
                VehicleSoftware(name: "Climatizacion 4 zonas", category: .climate, currentVersion: "3.0.0", latestVersion: "3.0.0", status: .upToDate),
            ]),
            VehicleModel(name: "iX", year: 2024, software: [
                VehicleSoftware(name: "eDrive Dual Motor", category: .ecu, currentVersion: "4.0.0", latestVersion: "4.0.0", status: .upToDate),
                VehicleSoftware(name: "Highway Assistant", category: .adas, currentVersion: "2.0.0", latestVersion: "2.5.0", status: .outdated),
                VehicleSoftware(name: "iDrive 9 Curved", category: .infotainment, currentVersion: "9.1.0", latestVersion: "9.1.0", status: .upToDate),
                VehicleSoftware(name: "BMS Gen5", category: .bms, currentVersion: "3.5.0", latestVersion: "4.0.0", status: .critical),
                VehicleSoftware(name: "5G Connectivity", category: .connectivity, currentVersion: "2.0.0", latestVersion: "2.0.0", status: .upToDate),
            ]),
        ]),

        // MARK: Hyundai
        VehicleBrand(name: "Hyundai", country: "Corea del Sur", models: [
            VehicleModel(name: "Tucson", year: 2024, software: [
                VehicleSoftware(name: "ECU Smartstream", category: .ecu, currentVersion: "3.0.0", latestVersion: "3.0.0", status: .upToDate),
                VehicleSoftware(name: "SmartSense", category: .adas, currentVersion: "2.5.0", latestVersion: "2.8.0", status: .updateAvailable),
                VehicleSoftware(name: "Display Audio", category: .infotainment, currentVersion: "4.0.0", latestVersion: "4.5.0", status: .outdated),
                VehicleSoftware(name: "DCT 8 vel", category: .transmission, currentVersion: "2.0.0", latestVersion: "2.0.0", status: .upToDate),
                VehicleSoftware(name: "HTRAC AWD", category: .body, currentVersion: "1.5.0", latestVersion: "1.5.0", status: .upToDate),
            ]),
            VehicleModel(name: "IONIQ 5", year: 2024, software: [
                VehicleSoftware(name: "PE Module 800V", category: .ecu, currentVersion: "2.5.0", latestVersion: "3.0.0", status: .outdated),
                VehicleSoftware(name: "SmartSense 2.0", category: .adas, currentVersion: "2.0.0", latestVersion: "2.0.0", status: .upToDate),
                VehicleSoftware(name: "ccNC Display", category: .infotainment, currentVersion: "3.0.0", latestVersion: "3.0.0", status: .upToDate),
                VehicleSoftware(name: "BMS 800V", category: .bms, currentVersion: "2.0.0", latestVersion: "2.5.0", status: .critical),
                VehicleSoftware(name: "Bluelink OTA", category: .connectivity, currentVersion: "4.0.0", latestVersion: "4.2.0", status: .updateAvailable),
            ]),
        ]),

        // MARK: Mercedes-Benz
        VehicleBrand(name: "Mercedes-Benz", country: "Alemania", models: [
            VehicleModel(name: "Clase C", year: 2024, software: [
                VehicleSoftware(name: "ECU M254", category: .ecu, currentVersion: "5.0.0", latestVersion: "5.0.0", status: .upToDate),
                VehicleSoftware(name: "Driver Assistance", category: .adas, currentVersion: "3.0.0", latestVersion: "3.2.0", status: .updateAvailable),
                VehicleSoftware(name: "MBUX", category: .infotainment, currentVersion: "7.0.0", latestVersion: "7.5.0", status: .outdated),
                VehicleSoftware(name: "9G-TRONIC", category: .transmission, currentVersion: "4.5.0", latestVersion: "4.5.0", status: .upToDate),
                VehicleSoftware(name: "AIRMATIC", category: .body, currentVersion: "2.0.0", latestVersion: "2.0.0", status: .upToDate),
                VehicleSoftware(name: "Mercedes me", category: .connectivity, currentVersion: "6.0.0", latestVersion: "6.5.0", status: .updateAvailable),
            ]),
            VehicleModel(name: "EQS", year: 2024, software: [
                VehicleSoftware(name: "eATS Dual Motor", category: .ecu, currentVersion: "3.0.0", latestVersion: "3.0.0", status: .upToDate),
                VehicleSoftware(name: "DRIVE PILOT L3", category: .adas, currentVersion: "1.0.0", latestVersion: "2.0.0", status: .critical),
                VehicleSoftware(name: "Hyperscreen MBUX", category: .infotainment, currentVersion: "8.0.0", latestVersion: "8.0.0", status: .upToDate),
                VehicleSoftware(name: "BMS 107.8 kWh", category: .bms, currentVersion: "2.5.0", latestVersion: "3.0.0", status: .critical),
                VehicleSoftware(name: "OTA Service", category: .connectivity, currentVersion: "3.0.0", latestVersion: "3.0.0", status: .upToDate),
                VehicleSoftware(name: "THERMOTRONIC", category: .climate, currentVersion: "2.0.0", latestVersion: "2.2.0", status: .updateAvailable),
            ]),
        ]),
    ]

    // MARK: - Metodos de consulta

    static func getAllBrands() -> [VehicleBrand] {
        brands
    }

    static func getBrand(named name: String) -> VehicleBrand? {
        brands.first { $0.name.lowercased() == name.lowercased() }
    }

    static func scanVehicle(brand brandName: String, model modelName: String) -> ScanResult? {
        guard let brand = getBrand(named: brandName),
              let model = brand.models.first(where: { $0.name.lowercased() == modelName.lowercased() }) else {
            return nil
        }
        return ScanResult(brand: brand.name, model: model.name, country: brand.country, software: model.software)
    }

    static func searchSoftware(query: String) -> [(brand: String, model: String, software: VehicleSoftware)] {
        var results: [(brand: String, model: String, software: VehicleSoftware)] = []
        for brand in brands {
            for model in brand.models {
                for sw in model.software {
                    if sw.name.lowercased().contains(query.lowercased()) ||
                       sw.category.rawValue.lowercased().contains(query.lowercased()) {
                        results.append((brand: brand.name, model: model.name, software: sw))
                    }
                }
            }
        }
        return results
    }

    static func getStatistics() -> (totalBrands: Int, totalModels: Int, totalSoftware: Int, byStatus: [SoftwareStatus: Int]) {
        var totalModels = 0
        var totalSoftware = 0
        var byStatus: [SoftwareStatus: Int] = [:]

        for status in SoftwareStatus.allCases {
            byStatus[status] = 0
        }

        for brand in brands {
            totalModels += brand.models.count
            for model in brand.models {
                totalSoftware += model.software.count
                for sw in model.software {
                    byStatus[sw.status, default: 0] += 1
                }
            }
        }

        return (brands.count, totalModels, totalSoftware, byStatus)
    }

    static func getBlogPosts() -> [BlogPost] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        return [
            BlogPost(
                title: "Como la microbiota impacta en la salud mental",
                summary: "La microbiota intestinal tiene un rol crucial en nuestra salud mental y fisica.",
                content: """
                La microbiota intestinal, compuesta por billones de microorganismos, juega un papel fundamental en nuestra salud mental. \
                Estudios recientes han demostrado que el eje intestino-cerebro es una via de comunicacion bidireccional que influye en \
                nuestro estado de animo, niveles de ansiedad y funciones cognitivas.

                Los neurotransmisores como la serotonina, de la cual aproximadamente el 95% se produce en el intestino, son regulados \
                en parte por nuestra microbiota. Una microbiota diversa y equilibrada se asocia con mejor salud mental, mientras que \
                la disbiosis (desequilibrio microbiano) se ha relacionado con trastornos como la depresion y la ansiedad.

                Para mantener una microbiota saludable, es importante:
                - Consumir una dieta rica en fibra y alimentos fermentados
                - Evitar el uso excesivo de antibioticos
                - Manejar el estres de manera efectiva
                - Dormir adecuadamente
                - Hacer ejercicio regularmente
                """,
                date: dateFormatter.date(from: "2024-12-15") ?? Date(),
                category: "Microbiota",
                imageSystemName: "brain.head.profile"
            ),
            BlogPost(
                title: "10 alimentos que favorecen la microbiota",
                summary: "Descubre como una dieta equilibrada puede ayudar a mantener tu microbiota en optimas condiciones.",
                content: """
                Una alimentacion adecuada es clave para mantener una microbiota intestinal saludable. Aqui te presentamos 10 alimentos \
                que pueden ayudarte:

                1. Yogur natural: Rico en probioticos como Lactobacillus y Bifidobacterium
                2. Kefir: Contiene una variedad mas amplia de cepas probioticas
                3. Chucrut: Fermentado natural rico en bacterias beneficiosas
                4. Kimchi: Aporta diversidad microbiana y vitaminas
                5. Platano verde: Excelente fuente de almidon resistente
                6. Ajo: Prebiotico natural que alimenta bacterias beneficiosas
                7. Cebolla: Rica en inulina, un prebiotico poderoso
                8. Esparagos: Contienen fructooligosacaridos (FOS)
                9. Avena: Fibra soluble que nutre la microbiota
                10. Legumbres: Fuente de fibra y proteina vegetal

                Incorporar estos alimentos gradualmente en tu dieta puede mejorar significativamente la diversidad y salud de tu microbiota.
                """,
                date: dateFormatter.date(from: "2024-12-01") ?? Date(),
                category: "Nutricion",
                imageSystemName: "leaf.fill"
            ),
            BlogPost(
                title: "El eje intestino-cerebro: lo que necesitas saber",
                summary: "Exploramos la conexion cientifica entre tu intestino y tu cerebro.",
                content: """
                El eje intestino-cerebro es un sistema de comunicacion bidireccional que conecta el sistema nervioso central con el \
                sistema nervioso enterico del tracto gastrointestinal. Esta conexion involucra multiples vias:

                - Via neural: A traves del nervio vago
                - Via endocrina: Mediante hormonas intestinales
                - Via inmune: A traves de citoquinas y celulas inmunes
                - Via metabolica: Mediante metabolitos microbianos

                Investigaciones recientes han revelado que la microbiota intestinal puede influir en:
                - La regulacion del estres
                - El comportamiento social
                - La memoria y el aprendizaje
                - El desarrollo neurologico

                Comprender este eje es fundamental para desarrollar nuevas estrategias terapeuticas que aborden trastornos \
                neurologicos y psiquiatricos desde una perspectiva integral.
                """,
                date: dateFormatter.date(from: "2024-11-20") ?? Date(),
                category: "Ciencia",
                imageSystemName: "waveform.path.ecg"
            ),
            BlogPost(
                title: "Estres y microbiota: una relacion bidireccional",
                summary: "El estres afecta tu microbiota, y tu microbiota afecta como manejas el estres.",
                content: """
                La relacion entre el estres y la microbiota intestinal es compleja y bidireccional. El estres cronico puede alterar \
                la composicion de la microbiota, reduciendo la diversidad bacteriana y favoreciendo el crecimiento de bacterias \
                potencialmente daninas.

                Por otro lado, una microbiota alterada puede amplificar la respuesta al estres del organismo, creando un ciclo \
                vicioso. Estudios en modelos animales han mostrado que ratones libres de germenes (sin microbiota) presentan una \
                respuesta exagerada al estres.

                Estrategias para romper este ciclo:
                - Practicar meditacion y mindfulness
                - Incorporar probioticos especificos (psicobioticos)
                - Mantener una rutina de sueno regular
                - Realizar actividad fisica moderada
                - Llevar una dieta antiinflamatoria rica en omega-3
                """,
                date: dateFormatter.date(from: "2024-11-10") ?? Date(),
                category: "Salud Mental",
                imageSystemName: "heart.text.square"
            ),
        ]
    }
}
