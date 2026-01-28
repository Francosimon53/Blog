"""
Base de Datos de Software de Vehículos
======================================
Contiene información de software para diversas marcas y modelos.
"""

from vehicle_software_scanner import (
    VehicleBrand,
    VehicleModel,
    VehicleSoftware,
    VehicleSoftwareScanner,
    SoftwareCategory
)


def create_toyota_brand() -> VehicleBrand:
    """Crea la marca Toyota con sus modelos y software."""
    toyota = VehicleBrand(name="Toyota", country="Japón")

    # Toyota Corolla
    corolla = VehicleModel(name="Corolla", year_start=2019, year_end=2024)
    corolla.software_list = [
        VehicleSoftware(
            name="Toyota ECU-M",
            version="3.2.1",
            category=SoftwareCategory.ECU,
            latest_version="3.4.0",
            release_date="2024-06-15",
            description="Unidad de control del motor principal"
        ),
        VehicleSoftware(
            name="Entune 3.0",
            version="2.8.5",
            category=SoftwareCategory.INFOTAINMENT,
            latest_version="3.1.2",
            release_date="2024-09-01",
            description="Sistema multimedia y navegación"
        ),
        VehicleSoftware(
            name="Toyota Safety Sense 2.5",
            version="2.5.0",
            category=SoftwareCategory.ADAS,
            latest_version="2.5.0",
            release_date="2024-01-10",
            description="Sistema de asistencia de seguridad"
        ),
        VehicleSoftware(
            name="ABS Controller",
            version="1.4.2",
            category=SoftwareCategory.ABS,
            latest_version="1.5.0",
            release_date="2024-03-20",
            description="Control del sistema de frenos ABS",
            critical_update=True
        ),
        VehicleSoftware(
            name="Climate Control Module",
            version="2.1.0",
            category=SoftwareCategory.CLIMATE,
            latest_version="2.1.0",
            release_date="2023-11-05",
            description="Control de climatización automática"
        ),
    ]

    # Toyota RAV4
    rav4 = VehicleModel(name="RAV4", year_start=2020, year_end=None)
    rav4.software_list = [
        VehicleSoftware(
            name="Toyota ECU-H",
            version="4.0.2",
            category=SoftwareCategory.ECU,
            latest_version="4.1.0",
            release_date="2024-08-20",
            description="ECU para motor híbrido"
        ),
        VehicleSoftware(
            name="Toyota Connected Services",
            version="5.2.1",
            category=SoftwareCategory.CONNECTIVITY,
            latest_version="5.3.0",
            release_date="2024-10-01",
            description="Servicios de conectividad y telemática"
        ),
        VehicleSoftware(
            name="Toyota Safety Sense 2.5+",
            version="2.6.1",
            category=SoftwareCategory.ADAS,
            latest_version="2.6.1",
            release_date="2024-07-15",
            description="Sistema ADAS avanzado"
        ),
        VehicleSoftware(
            name="Hybrid Battery Manager",
            version="3.0.5",
            category=SoftwareCategory.BATTERY,
            latest_version="3.1.2",
            release_date="2024-09-10",
            description="Gestión de batería híbrida"
        ),
    ]

    # Toyota Camry
    camry = VehicleModel(name="Camry", year_start=2018, year_end=2024)
    camry.software_list = [
        VehicleSoftware(
            name="Toyota ECU-S",
            version="2.9.0",
            category=SoftwareCategory.ECU,
            latest_version="3.0.0",
            release_date="2024-05-01",
            description="ECU sedan premium"
        ),
        VehicleSoftware(
            name="JBL Audio System",
            version="4.5.2",
            category=SoftwareCategory.INFOTAINMENT,
            latest_version="4.5.2",
            release_date="2024-02-28",
            description="Sistema de audio premium JBL"
        ),
        VehicleSoftware(
            name="Transmission Controller",
            version="1.8.0",
            category=SoftwareCategory.TRANSMISSION,
            latest_version="2.0.0",
            release_date="2024-04-15",
            description="Control de transmisión automática"
        ),
    ]

    toyota.models = [corolla, rav4, camry]
    return toyota


def create_volkswagen_brand() -> VehicleBrand:
    """Crea la marca Volkswagen con sus modelos y software."""
    vw = VehicleBrand(name="Volkswagen", country="Alemania")

    # VW Golf
    golf = VehicleModel(name="Golf", year_start=2020, year_end=None)
    golf.software_list = [
        VehicleSoftware(
            name="MIB3 Infotainment",
            version="3.2.1",
            category=SoftwareCategory.INFOTAINMENT,
            latest_version="3.4.0",
            release_date="2024-11-01",
            description="Sistema MIB3 con pantalla táctil"
        ),
        VehicleSoftware(
            name="EA211 ECU",
            version="5.4.2",
            category=SoftwareCategory.ECU,
            latest_version="5.5.0",
            release_date="2024-08-15",
            description="Control motor TSI 1.4/1.5"
        ),
        VehicleSoftware(
            name="IQ.DRIVE",
            version="2.1.0",
            category=SoftwareCategory.ADAS,
            latest_version="2.3.0",
            release_date="2024-09-20",
            description="Sistema de asistencia a la conducción",
            critical_update=True
        ),
        VehicleSoftware(
            name="DSG Controller",
            version="4.2.1",
            category=SoftwareCategory.TRANSMISSION,
            latest_version="4.2.1",
            release_date="2024-03-10",
            description="Control caja DSG de doble embrague"
        ),
        VehicleSoftware(
            name="We Connect",
            version="2.5.0",
            category=SoftwareCategory.CONNECTIVITY,
            latest_version="2.6.1",
            release_date="2024-10-05",
            description="Servicios conectados Volkswagen"
        ),
    ]

    # VW Tiguan
    tiguan = VehicleModel(name="Tiguan", year_start=2019, year_end=None)
    tiguan.software_list = [
        VehicleSoftware(
            name="MIB3 Pro",
            version="3.3.0",
            category=SoftwareCategory.INFOTAINMENT,
            latest_version="3.4.0",
            release_date="2024-11-01",
            description="Sistema multimedia premium"
        ),
        VehicleSoftware(
            name="EA888 ECU",
            version="6.1.2",
            category=SoftwareCategory.ECU,
            latest_version="6.2.0",
            release_date="2024-07-20",
            description="Control motor TSI 2.0"
        ),
        VehicleSoftware(
            name="4Motion Controller",
            version="3.0.5",
            category=SoftwareCategory.TRANSMISSION,
            latest_version="3.0.5",
            release_date="2024-01-15",
            description="Control tracción integral"
        ),
        VehicleSoftware(
            name="Park Assist",
            version="2.4.0",
            category=SoftwareCategory.ADAS,
            latest_version="2.5.0",
            release_date="2024-06-01",
            description="Asistente de aparcamiento automático"
        ),
    ]

    # VW ID.4 (Eléctrico)
    id4 = VehicleModel(name="ID.4", year_start=2021, year_end=None)
    id4.software_list = [
        VehicleSoftware(
            name="VW.OS",
            version="3.0.0",
            category=SoftwareCategory.ECU,
            latest_version="3.2.0",
            release_date="2024-10-15",
            description="Sistema operativo del vehículo eléctrico"
        ),
        VehicleSoftware(
            name="ID. Software",
            version="3.1.0",
            category=SoftwareCategory.INFOTAINMENT,
            latest_version="3.3.0",
            release_date="2024-11-10",
            description="Interfaz de usuario ID."
        ),
        VehicleSoftware(
            name="BMS Pro",
            version="2.5.1",
            category=SoftwareCategory.BATTERY,
            latest_version="2.6.0",
            release_date="2024-09-25",
            description="Gestión de batería de alto voltaje"
        ),
        VehicleSoftware(
            name="ID. Pilot",
            version="1.8.0",
            category=SoftwareCategory.ADAS,
            latest_version="2.0.0",
            release_date="2024-08-01",
            description="Sistema de conducción semi-autónoma",
            critical_update=True
        ),
    ]

    vw.models = [golf, tiguan, id4]
    return vw


def create_ford_brand() -> VehicleBrand:
    """Crea la marca Ford con sus modelos y software."""
    ford = VehicleBrand(name="Ford", country="Estados Unidos")

    # Ford Mustang
    mustang = VehicleModel(name="Mustang", year_start=2018, year_end=None)
    mustang.software_list = [
        VehicleSoftware(
            name="SYNC 4",
            version="4.1.2",
            category=SoftwareCategory.INFOTAINMENT,
            latest_version="4.2.0",
            release_date="2024-09-15",
            description="Sistema SYNC 4 con pantalla de 12 pulgadas"
        ),
        VehicleSoftware(
            name="Coyote V8 ECU",
            version="7.2.0",
            category=SoftwareCategory.ECU,
            latest_version="7.2.0",
            release_date="2024-05-20",
            description="Control motor V8 5.0L"
        ),
        VehicleSoftware(
            name="MagneRide",
            version="3.1.0",
            category=SoftwareCategory.BODY,
            latest_version="3.2.0",
            release_date="2024-07-10",
            description="Control de suspensión adaptativa"
        ),
        VehicleSoftware(
            name="Track Apps",
            version="2.3.1",
            category=SoftwareCategory.INFOTAINMENT,
            latest_version="2.4.0",
            release_date="2024-06-01",
            description="Aplicaciones de rendimiento en pista"
        ),
    ]

    # Ford F-150
    f150 = VehicleModel(name="F-150", year_start=2021, year_end=None)
    f150.software_list = [
        VehicleSoftware(
            name="SYNC 4A",
            version="4.2.0",
            category=SoftwareCategory.INFOTAINMENT,
            latest_version="4.2.0",
            release_date="2024-10-01",
            description="Sistema SYNC 4A con pantalla de 15.5 pulgadas"
        ),
        VehicleSoftware(
            name="PowerBoost ECU",
            version="2.8.1",
            category=SoftwareCategory.ECU,
            latest_version="2.9.0",
            release_date="2024-08-25",
            description="Control motor híbrido PowerBoost"
        ),
        VehicleSoftware(
            name="Pro Trailer Backup",
            version="1.5.0",
            category=SoftwareCategory.ADAS,
            latest_version="1.6.0",
            release_date="2024-04-15",
            description="Asistente de reversa con remolque"
        ),
        VehicleSoftware(
            name="FordPass Connect",
            version="3.4.2",
            category=SoftwareCategory.CONNECTIVITY,
            latest_version="3.5.0",
            release_date="2024-09-10",
            description="Módulo de conectividad FordPass"
        ),
        VehicleSoftware(
            name="Onboard Scales",
            version="1.2.0",
            category=SoftwareCategory.BODY,
            latest_version="1.2.0",
            release_date="2024-02-20",
            description="Sistema de pesaje integrado"
        ),
    ]

    # Ford Mustang Mach-E (Eléctrico)
    mach_e = VehicleModel(name="Mustang Mach-E", year_start=2021, year_end=None)
    mach_e.software_list = [
        VehicleSoftware(
            name="SYNC 4A EV",
            version="4.3.0",
            category=SoftwareCategory.INFOTAINMENT,
            latest_version="4.4.0",
            release_date="2024-11-05",
            description="SYNC optimizado para vehículos eléctricos"
        ),
        VehicleSoftware(
            name="Mach-E Drive Module",
            version="3.2.1",
            category=SoftwareCategory.ECU,
            latest_version="3.3.0",
            release_date="2024-10-20",
            description="Control de motor eléctrico"
        ),
        VehicleSoftware(
            name="BlueCruise",
            version="1.2.0",
            category=SoftwareCategory.ADAS,
            latest_version="1.4.0",
            release_date="2024-09-01",
            description="Sistema de conducción manos libres",
            critical_update=True
        ),
        VehicleSoftware(
            name="Battery Thermal Manager",
            version="2.1.5",
            category=SoftwareCategory.BATTERY,
            latest_version="2.2.0",
            release_date="2024-08-15",
            description="Gestión térmica de batería"
        ),
    ]

    ford.models = [mustang, f150, mach_e]
    return ford


def create_bmw_brand() -> VehicleBrand:
    """Crea la marca BMW con sus modelos y software."""
    bmw = VehicleBrand(name="BMW", country="Alemania")

    # BMW Serie 3
    serie3 = VehicleModel(name="Serie 3", year_start=2019, year_end=None)
    serie3.software_list = [
        VehicleSoftware(
            name="iDrive 8",
            version="8.2.0",
            category=SoftwareCategory.INFOTAINMENT,
            latest_version="8.3.0",
            release_date="2024-10-15",
            description="Sistema iDrive con pantalla curva"
        ),
        VehicleSoftware(
            name="B48 DME",
            version="4.5.2",
            category=SoftwareCategory.ECU,
            latest_version="4.6.0",
            release_date="2024-07-20",
            description="Control motor 4 cilindros turbo"
        ),
        VehicleSoftware(
            name="Driving Assistant Pro",
            version="3.1.0",
            category=SoftwareCategory.ADAS,
            latest_version="3.2.0",
            release_date="2024-08-10",
            description="Asistente de conducción profesional"
        ),
        VehicleSoftware(
            name="Steptronic ZF",
            version="2.8.1",
            category=SoftwareCategory.TRANSMISSION,
            latest_version="2.8.1",
            release_date="2024-04-05",
            description="Control transmisión automática 8 velocidades"
        ),
        VehicleSoftware(
            name="BMW Connected Drive",
            version="5.4.0",
            category=SoftwareCategory.CONNECTIVITY,
            latest_version="5.5.0",
            release_date="2024-09-20",
            description="Servicios conectados BMW"
        ),
    ]

    # BMW X5
    x5 = VehicleModel(name="X5", year_start=2019, year_end=None)
    x5.software_list = [
        VehicleSoftware(
            name="iDrive 8.5",
            version="8.5.0",
            category=SoftwareCategory.INFOTAINMENT,
            latest_version="8.5.0",
            release_date="2024-11-01",
            description="iDrive premium para SUV"
        ),
        VehicleSoftware(
            name="B58 DME",
            version="5.2.1",
            category=SoftwareCategory.ECU,
            latest_version="5.3.0",
            release_date="2024-09-15",
            description="Control motor 6 cilindros en línea"
        ),
        VehicleSoftware(
            name="xDrive Controller",
            version="4.1.0",
            category=SoftwareCategory.TRANSMISSION,
            latest_version="4.1.0",
            release_date="2024-06-20",
            description="Control tracción integral inteligente"
        ),
        VehicleSoftware(
            name="Air Suspension",
            version="2.3.0",
            category=SoftwareCategory.BODY,
            latest_version="2.4.0",
            release_date="2024-05-10",
            description="Control suspensión neumática"
        ),
    ]

    # BMW iX (Eléctrico)
    ix = VehicleModel(name="iX", year_start=2022, year_end=None)
    ix.software_list = [
        VehicleSoftware(
            name="iDrive 9",
            version="9.0.0",
            category=SoftwareCategory.INFOTAINMENT,
            latest_version="9.1.0",
            release_date="2024-10-25",
            description="iDrive de nueva generación"
        ),
        VehicleSoftware(
            name="eDrive Control",
            version="2.4.0",
            category=SoftwareCategory.ECU,
            latest_version="2.5.0",
            release_date="2024-09-05",
            description="Control de motores eléctricos"
        ),
        VehicleSoftware(
            name="BMW Intelligent Personal Assistant",
            version="3.0.0",
            category=SoftwareCategory.INFOTAINMENT,
            latest_version="3.1.0",
            release_date="2024-08-20",
            description="Asistente de voz con IA"
        ),
        VehicleSoftware(
            name="High-Voltage BMS",
            version="1.8.0",
            category=SoftwareCategory.BATTERY,
            latest_version="2.0.0",
            release_date="2024-11-10",
            description="Gestión de batería de alto voltaje",
            critical_update=True
        ),
    ]

    bmw.models = [serie3, x5, ix]
    return bmw


def create_hyundai_brand() -> VehicleBrand:
    """Crea la marca Hyundai con sus modelos y software."""
    hyundai = VehicleBrand(name="Hyundai", country="Corea del Sur")

    # Hyundai Tucson
    tucson = VehicleModel(name="Tucson", year_start=2021, year_end=None)
    tucson.software_list = [
        VehicleSoftware(
            name="Bluelink",
            version="4.2.0",
            category=SoftwareCategory.CONNECTIVITY,
            latest_version="4.3.0",
            release_date="2024-09-15",
            description="Sistema de conectividad Bluelink"
        ),
        VehicleSoftware(
            name="Smartstream ECU",
            version="3.1.2",
            category=SoftwareCategory.ECU,
            latest_version="3.2.0",
            release_date="2024-08-10",
            description="Control motor Smartstream"
        ),
        VehicleSoftware(
            name="SmartSense",
            version="2.5.0",
            category=SoftwareCategory.ADAS,
            latest_version="2.5.0",
            release_date="2024-06-20",
            description="Sistema de seguridad SmartSense"
        ),
        VehicleSoftware(
            name="DCT Controller",
            version="2.2.1",
            category=SoftwareCategory.TRANSMISSION,
            latest_version="2.3.0",
            release_date="2024-07-05",
            description="Control caja de doble embrague"
        ),
    ]

    # Hyundai IONIQ 5
    ioniq5 = VehicleModel(name="IONIQ 5", year_start=2022, year_end=None)
    ioniq5.software_list = [
        VehicleSoftware(
            name="E-GMP ECU",
            version="2.8.0",
            category=SoftwareCategory.ECU,
            latest_version="3.0.0",
            release_date="2024-10-20",
            description="Control plataforma E-GMP"
        ),
        VehicleSoftware(
            name="ccNC Navigation",
            version="5.1.0",
            category=SoftwareCategory.INFOTAINMENT,
            latest_version="5.2.0",
            release_date="2024-09-01",
            description="Sistema de navegación conectada"
        ),
        VehicleSoftware(
            name="V2L Controller",
            version="1.5.0",
            category=SoftwareCategory.BATTERY,
            latest_version="1.6.0",
            release_date="2024-08-15",
            description="Control Vehicle-to-Load"
        ),
        VehicleSoftware(
            name="Highway Driving Assist 2",
            version="2.1.0",
            category=SoftwareCategory.ADAS,
            latest_version="2.2.0",
            release_date="2024-07-25",
            description="Asistente de conducción en autopista"
        ),
        VehicleSoftware(
            name="Battery Preconditioning",
            version="1.3.0",
            category=SoftwareCategory.BATTERY,
            latest_version="1.4.0",
            release_date="2024-06-10",
            description="Preacondicionamiento de batería para carga"
        ),
    ]

    hyundai.models = [tucson, ioniq5]
    return hyundai


def create_mercedes_brand() -> VehicleBrand:
    """Crea la marca Mercedes-Benz con sus modelos y software."""
    mercedes = VehicleBrand(name="Mercedes-Benz", country="Alemania")

    # Mercedes Clase C
    clase_c = VehicleModel(name="Clase C", year_start=2022, year_end=None)
    clase_c.software_list = [
        VehicleSoftware(
            name="MBUX 2.0",
            version="2.5.0",
            category=SoftwareCategory.INFOTAINMENT,
            latest_version="2.6.0",
            release_date="2024-10-10",
            description="Sistema multimedia MBUX segunda generación"
        ),
        VehicleSoftware(
            name="M254 ECU",
            version="3.2.1",
            category=SoftwareCategory.ECU,
            latest_version="3.3.0",
            release_date="2024-08-20",
            description="Control motor 4 cilindros mild-hybrid"
        ),
        VehicleSoftware(
            name="Driver Assistance Package",
            version="4.1.0",
            category=SoftwareCategory.ADAS,
            latest_version="4.2.0",
            release_date="2024-09-05",
            description="Paquete de asistencia al conductor"
        ),
        VehicleSoftware(
            name="9G-TRONIC",
            version="2.8.0",
            category=SoftwareCategory.TRANSMISSION,
            latest_version="2.8.0",
            release_date="2024-05-15",
            description="Control transmisión 9 velocidades"
        ),
        VehicleSoftware(
            name="Mercedes me connect",
            version="6.2.0",
            category=SoftwareCategory.CONNECTIVITY,
            latest_version="6.3.0",
            release_date="2024-10-25",
            description="Servicios conectados Mercedes"
        ),
    ]

    # Mercedes EQS (Eléctrico)
    eqs = VehicleModel(name="EQS", year_start=2022, year_end=None)
    eqs.software_list = [
        VehicleSoftware(
            name="MBUX Hyperscreen",
            version="3.0.0",
            category=SoftwareCategory.INFOTAINMENT,
            latest_version="3.2.0",
            release_date="2024-11-01",
            description="Sistema MBUX con pantalla de 56 pulgadas"
        ),
        VehicleSoftware(
            name="eATS Control",
            version="2.5.0",
            category=SoftwareCategory.ECU,
            latest_version="2.6.0",
            release_date="2024-09-20",
            description="Control del tren motriz eléctrico"
        ),
        VehicleSoftware(
            name="DRIVE PILOT",
            version="1.5.0",
            category=SoftwareCategory.ADAS,
            latest_version="2.0.0",
            release_date="2024-10-15",
            description="Conducción autónoma nivel 3",
            critical_update=True
        ),
        VehicleSoftware(
            name="Intelligent Range Manager",
            version="1.8.0",
            category=SoftwareCategory.BATTERY,
            latest_version="1.9.0",
            release_date="2024-08-10",
            description="Gestión inteligente de autonomía"
        ),
        VehicleSoftware(
            name="AIRMATIC",
            version="3.2.0",
            category=SoftwareCategory.BODY,
            latest_version="3.2.0",
            release_date="2024-06-25",
            description="Suspensión neumática adaptativa"
        ),
    ]

    mercedes.models = [clase_c, eqs]
    return mercedes


def initialize_scanner() -> VehicleSoftwareScanner:
    """
    Inicializa el escáner con todas las marcas disponibles.

    Returns:
        VehicleSoftwareScanner configurado con la base de datos
    """
    scanner = VehicleSoftwareScanner()

    # Agregar todas las marcas
    scanner.add_brand(create_toyota_brand())
    scanner.add_brand(create_volkswagen_brand())
    scanner.add_brand(create_ford_brand())
    scanner.add_brand(create_bmw_brand())
    scanner.add_brand(create_hyundai_brand())
    scanner.add_brand(create_mercedes_brand())

    return scanner


# Para uso rápido
if __name__ == "__main__":
    scanner = initialize_scanner()
    print("Base de datos cargada:")
    print(f"- Marcas: {scanner.list_brands()}")
    for brand in scanner.list_brands():
        print(f"  - {brand}: {scanner.list_models(brand)}")
