#!/usr/bin/env python3
"""
Vehicle Software Scanner - CLI
==============================
Interfaz de línea de comandos para escanear software de vehículos.

Uso:
    python main.py                    # Modo interactivo
    python main.py --scan Toyota Corolla
    python main.py --list-brands
    python main.py --list-models Toyota
    python main.py --search "ECU"
    python main.py --report BMW "Serie 3"
"""

import argparse
import sys
from vehicle_database import initialize_scanner
from vehicle_software_scanner import SoftwareCategory


def print_header():
    """Imprime el encabezado del programa."""
    print("""
╔═══════════════════════════════════════════════════════════════╗
║           VEHICLE SOFTWARE SCANNER v1.0                       ║
║       Escaneo de Software Automotriz por Marca y Modelo       ║
╚═══════════════════════════════════════════════════════════════╝
""")


def print_menu():
    """Imprime el menú principal."""
    print("""
┌───────────────────────────────────────────────────────────────┐
│                      MENÚ PRINCIPAL                           │
├───────────────────────────────────────────────────────────────┤
│  1. Listar marcas disponibles                                 │
│  2. Listar modelos de una marca                               │
│  3. Escanear vehículo (marca + modelo)                        │
│  4. Buscar software por nombre                                │
│  5. Ver actualizaciones pendientes                            │
│  6. Ver actualizaciones críticas                              │
│  7. Generar reporte completo                                  │
│  8. Ver estadísticas generales                                │
│  9. Filtrar por categoría de software                         │
│  0. Salir                                                     │
└───────────────────────────────────────────────────────────────┘
""")


def list_brands(scanner):
    """Lista todas las marcas disponibles."""
    print("\n📋 MARCAS DISPONIBLES:")
    print("-" * 40)
    for i, brand in enumerate(scanner.list_brands(), 1):
        brand_obj = scanner.get_brand(brand)
        print(f"  {i}. {brand} ({brand_obj.country})")
    print()


def list_models(scanner):
    """Lista los modelos de una marca."""
    brand_name = input("\n🏭 Ingrese el nombre de la marca: ").strip()
    models = scanner.list_models(brand_name)

    if not models:
        print(f"\n❌ No se encontró la marca '{brand_name}'")
        return

    brand = scanner.get_brand(brand_name)
    print(f"\n🚗 MODELOS DE {brand.name.upper()} ({brand.country}):")
    print("-" * 40)
    for model in brand.models:
        print(f"  • {model}")
    print()


def scan_vehicle(scanner):
    """Escanea el software de un vehículo."""
    brand_name = input("\n🏭 Ingrese la marca: ").strip()
    model_name = input("🚗 Ingrese el modelo: ").strip()

    result = scanner.scan_vehicle(brand_name, model_name)

    if "error" in result:
        print(f"\n❌ {result['error']}")
        return

    print(f"\n✅ RESULTADOS DEL ESCANEO")
    print("=" * 50)
    print(f"Marca: {result['brand']}")
    print(f"Modelo: {result['model']}")
    print(f"País: {result['country']}")
    print(f"\n📊 RESUMEN:")
    print(f"  ✓ Actualizados: {result['summary']['up_to_date']}")
    print(f"  ⚠ Actualización disponible: {result['summary']['update_available']}")
    print(f"  ⚡ Desactualizados: {result['summary']['outdated']}")
    print(f"  🚨 Críticos: {result['summary']['critical']}")

    print(f"\n📦 SOFTWARE ({result['total_software']} módulos):")
    print("-" * 50)

    for sw in result["software"]:
        status_icon = {
            "Actualizado": "✓",
            "Actualización Disponible": "⚠",
            "Desactualizado": "⚡",
            "Actualización Crítica": "🚨"
        }.get(sw["status"], "?")

        print(f"\n  {status_icon} {sw['name']}")
        print(f"    Categoría: {sw['category']}")
        print(f"    Versión: {sw['current_version']} → {sw['latest_version']}")
        print(f"    Estado: {sw['status']}")


def search_software(scanner):
    """Busca software por nombre."""
    query = input("\n🔍 Ingrese término de búsqueda: ").strip()

    if not query:
        print("❌ Debe ingresar un término de búsqueda")
        return

    results = scanner.search_software(query)

    if not results:
        print(f"\n❌ No se encontró software con '{query}'")
        return

    print(f"\n✅ RESULTADOS DE BÚSQUEDA: '{query}'")
    print("=" * 60)
    print(f"Encontrados: {len(results)} resultados\n")

    for r in results:
        print(f"  • {r['software']} v{r['version']}")
        print(f"    {r['brand']} {r['model']} | {r['category']}")
        print(f"    Estado: {r['status']}")
        print()


def show_updates_needed(scanner):
    """Muestra actualizaciones pendientes de un vehículo."""
    brand_name = input("\n🏭 Ingrese la marca: ").strip()
    model_name = input("🚗 Ingrese el modelo: ").strip()

    updates = scanner.find_updates_needed(brand_name, model_name)

    if not updates:
        print(f"\n✅ No hay actualizaciones pendientes para {brand_name} {model_name}")
        return

    print(f"\n⚠ ACTUALIZACIONES PENDIENTES - {brand_name} {model_name}")
    print("=" * 50)

    for sw in updates:
        print(f"\n  • {sw['name']}")
        print(f"    {sw['current_version']} → {sw['latest_version']}")
        print(f"    Estado: {sw['status']}")


def show_critical_updates(scanner):
    """Muestra actualizaciones críticas."""
    brand_name = input("\n🏭 Ingrese la marca: ").strip()
    model_name = input("🚗 Ingrese el modelo: ").strip()

    critical = scanner.find_critical_updates(brand_name, model_name)

    if not critical:
        print(f"\n✅ No hay actualizaciones críticas para {brand_name} {model_name}")
        return

    print(f"\n🚨 ACTUALIZACIONES CRÍTICAS - {brand_name} {model_name}")
    print("=" * 50)

    for sw in critical:
        print(f"\n  🚨 {sw['name']}")
        print(f"     {sw['current_version']} → {sw['latest_version']}")
        print(f"     Categoría: {sw['category']}")


def generate_report(scanner):
    """Genera un reporte completo."""
    brand_name = input("\n🏭 Ingrese la marca: ").strip()
    model_name = input("🚗 Ingrese el modelo: ").strip()

    report = scanner.generate_report(brand_name, model_name)
    print("\n" + report)


def show_statistics(scanner):
    """Muestra estadísticas generales."""
    stats = scanner.get_statistics()

    print("\n📊 ESTADÍSTICAS GENERALES")
    print("=" * 50)
    print(f"Total de marcas: {stats['total_brands']}")
    print(f"Total de modelos: {stats['total_models']}")
    print(f"Total de software: {stats['total_software']}")

    print("\n📦 Por categoría:")
    for cat, count in stats['by_category'].items():
        print(f"  • {cat}: {count}")

    print("\n📈 Por estado:")
    print(f"  ✓ Actualizados: {stats['by_status']['up_to_date']}")
    print(f"  ⚠ Actualización disponible: {stats['by_status']['update_available']}")
    print(f"  ⚡ Desactualizados: {stats['by_status']['outdated']}")
    print(f"  🚨 Críticos: {stats['by_status']['critical']}")


def filter_by_category(scanner):
    """Filtra software por categoría."""
    print("\n📂 CATEGORÍAS DISPONIBLES:")
    categories = list(SoftwareCategory)
    for i, cat in enumerate(categories, 1):
        print(f"  {i}. {cat.value}")

    try:
        choice = int(input("\nSeleccione categoría (número): "))
        if choice < 1 or choice > len(categories):
            print("❌ Opción inválida")
            return
        selected_cat = categories[choice - 1]
    except ValueError:
        print("❌ Debe ingresar un número")
        return

    brand_name = input("🏭 Ingrese la marca: ").strip()
    model_name = input("🚗 Ingrese el modelo: ").strip()

    results = scanner.scan_by_category(brand_name, model_name, selected_cat)

    if not results:
        print(f"\n❌ No se encontró software de tipo '{selected_cat.value}'")
        return

    print(f"\n✅ SOFTWARE DE CATEGORÍA: {selected_cat.value}")
    print("=" * 50)

    for sw in results:
        print(f"\n  • {sw['name']}")
        print(f"    Versión: {sw['current_version']} → {sw['latest_version']}")
        print(f"    Estado: {sw['status']}")


def interactive_mode(scanner):
    """Modo interactivo del programa."""
    print_header()

    while True:
        print_menu()
        choice = input("Seleccione una opción: ").strip()

        if choice == "1":
            list_brands(scanner)
        elif choice == "2":
            list_models(scanner)
        elif choice == "3":
            scan_vehicle(scanner)
        elif choice == "4":
            search_software(scanner)
        elif choice == "5":
            show_updates_needed(scanner)
        elif choice == "6":
            show_critical_updates(scanner)
        elif choice == "7":
            generate_report(scanner)
        elif choice == "8":
            show_statistics(scanner)
        elif choice == "9":
            filter_by_category(scanner)
        elif choice == "0":
            print("\n👋 ¡Hasta luego!")
            break
        else:
            print("\n❌ Opción no válida. Intente de nuevo.")

        input("\nPresione Enter para continuar...")


def main():
    """Función principal."""
    parser = argparse.ArgumentParser(
        description="Vehicle Software Scanner - Escaneo de software automotriz"
    )
    parser.add_argument(
        "--scan",
        nargs=2,
        metavar=("MARCA", "MODELO"),
        help="Escanear vehículo específico"
    )
    parser.add_argument(
        "--list-brands",
        action="store_true",
        help="Listar marcas disponibles"
    )
    parser.add_argument(
        "--list-models",
        metavar="MARCA",
        help="Listar modelos de una marca"
    )
    parser.add_argument(
        "--search",
        metavar="TÉRMINO",
        help="Buscar software por nombre"
    )
    parser.add_argument(
        "--report",
        nargs=2,
        metavar=("MARCA", "MODELO"),
        help="Generar reporte completo"
    )
    parser.add_argument(
        "--updates",
        nargs=2,
        metavar=("MARCA", "MODELO"),
        help="Ver actualizaciones pendientes"
    )
    parser.add_argument(
        "--stats",
        action="store_true",
        help="Ver estadísticas generales"
    )

    args = parser.parse_args()

    # Inicializar escáner
    scanner = initialize_scanner()

    # Modo línea de comandos
    if args.list_brands:
        for brand in scanner.list_brands():
            brand_obj = scanner.get_brand(brand)
            print(f"{brand} ({brand_obj.country})")
        return

    if args.list_models:
        models = scanner.list_models(args.list_models)
        if models:
            for model in models:
                print(model)
        else:
            print(f"Marca '{args.list_models}' no encontrada")
        return

    if args.scan:
        result = scanner.scan_vehicle(args.scan[0], args.scan[1])
        if "error" in result:
            print(result["error"])
        else:
            print(f"Marca: {result['brand']}")
            print(f"Modelo: {result['model']}")
            print(f"Software total: {result['total_software']}")
            print(f"Actualizados: {result['summary']['up_to_date']}")
            print(f"Pendientes: {result['summary']['update_available']}")
            print(f"Críticos: {result['summary']['critical']}")
        return

    if args.report:
        print(scanner.generate_report(args.report[0], args.report[1]))
        return

    if args.search:
        results = scanner.search_software(args.search)
        for r in results:
            print(f"{r['brand']} {r['model']}: {r['software']} v{r['version']} - {r['status']}")
        return

    if args.updates:
        updates = scanner.find_updates_needed(args.updates[0], args.updates[1])
        for u in updates:
            print(f"{u['name']}: {u['current_version']} -> {u['latest_version']} ({u['status']})")
        return

    if args.stats:
        stats = scanner.get_statistics()
        print(f"Marcas: {stats['total_brands']}")
        print(f"Modelos: {stats['total_models']}")
        print(f"Software: {stats['total_software']}")
        return

    # Modo interactivo (por defecto)
    interactive_mode(scanner)


if __name__ == "__main__":
    main()
