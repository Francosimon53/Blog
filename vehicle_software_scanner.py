"""
Vehicle Software Scanner
========================
Algoritmo para escanear y consultar software de vehículos por marca y modelo.

Autor: Generado con Claude
Fecha: 2026-01-28
"""

from dataclasses import dataclass, field
from typing import Optional
from enum import Enum


class SoftwareCategory(Enum):
    """Categorías de software de vehículos."""
    ECU = "ECU (Unidad de Control del Motor)"
    INFOTAINMENT = "Sistema de Infoentretenimiento"
    ADAS = "ADAS (Asistencia Avanzada al Conductor)"
    TRANSMISSION = "Control de Transmisión"
    ABS = "Sistema ABS/Frenos"
    AIRBAG = "Sistema de Airbags"
    CLIMATE = "Control de Climatización"
    BODY = "Módulo de Carrocería"
    BATTERY = "Gestión de Batería (BMS)"
    CONNECTIVITY = "Conectividad/Telemática"


class SoftwareStatus(Enum):
    """Estado del software."""
    UP_TO_DATE = "Actualizado"
    UPDATE_AVAILABLE = "Actualización Disponible"
    OUTDATED = "Desactualizado"
    CRITICAL = "Actualización Crítica"
    UNKNOWN = "Desconocido"


@dataclass
class VehicleSoftware:
    """Representa un software instalado en un vehículo."""
    name: str
    version: str
    category: SoftwareCategory
    latest_version: str
    release_date: str
    description: str = ""
    critical_update: bool = False

    @property
    def status(self) -> SoftwareStatus:
        """Determina el estado del software basado en versiones."""
        if self.critical_update:
            return SoftwareStatus.CRITICAL
        if self.version == self.latest_version:
            return SoftwareStatus.UP_TO_DATE

        # Comparar versiones (simplificado)
        current_parts = [int(x) for x in self.version.split('.') if x.isdigit()]
        latest_parts = [int(x) for x in self.latest_version.split('.') if x.isdigit()]

        if current_parts < latest_parts:
            # Si la diferencia en versión mayor es > 1, está muy desactualizado
            if latest_parts[0] - current_parts[0] > 1:
                return SoftwareStatus.OUTDATED
            return SoftwareStatus.UPDATE_AVAILABLE

        return SoftwareStatus.UNKNOWN


@dataclass
class VehicleModel:
    """Representa un modelo de vehículo."""
    name: str
    year_start: int
    year_end: Optional[int] = None
    software_list: list[VehicleSoftware] = field(default_factory=list)

    def __str__(self) -> str:
        year_range = f"{self.year_start}-{self.year_end or 'presente'}"
        return f"{self.name} ({year_range})"


@dataclass
class VehicleBrand:
    """Representa una marca de vehículos."""
    name: str
    country: str
    models: list[VehicleModel] = field(default_factory=list)

    def get_model(self, model_name: str) -> Optional[VehicleModel]:
        """Obtiene un modelo por nombre."""
        for model in self.models:
            if model.name.lower() == model_name.lower():
                return model
        return None


class VehicleSoftwareScanner:
    """
    Escáner de software de vehículos.

    Permite escanear, buscar y filtrar software de vehículos
    por marca, modelo, categoría y estado.
    """

    def __init__(self):
        self.brands: dict[str, VehicleBrand] = {}

    def add_brand(self, brand: VehicleBrand) -> None:
        """Agrega una marca al escáner."""
        self.brands[brand.name.lower()] = brand

    def get_brand(self, brand_name: str) -> Optional[VehicleBrand]:
        """Obtiene una marca por nombre."""
        return self.brands.get(brand_name.lower())

    def list_brands(self) -> list[str]:
        """Lista todas las marcas disponibles."""
        return [brand.name for brand in self.brands.values()]

    def list_models(self, brand_name: str) -> list[str]:
        """Lista todos los modelos de una marca."""
        brand = self.get_brand(brand_name)
        if not brand:
            return []
        return [model.name for model in brand.models]

    def scan_vehicle(self, brand_name: str, model_name: str) -> dict:
        """
        Escanea el software de un vehículo específico.

        Args:
            brand_name: Nombre de la marca
            model_name: Nombre del modelo

        Returns:
            Diccionario con resultados del escaneo
        """
        brand = self.get_brand(brand_name)
        if not brand:
            return {"error": f"Marca '{brand_name}' no encontrada"}

        model = brand.get_model(model_name)
        if not model:
            return {"error": f"Modelo '{model_name}' no encontrado para {brand.name}"}

        # Analizar software
        results = {
            "brand": brand.name,
            "model": str(model),
            "country": brand.country,
            "total_software": len(model.software_list),
            "software": [],
            "summary": {
                "up_to_date": 0,
                "update_available": 0,
                "outdated": 0,
                "critical": 0
            }
        }

        for sw in model.software_list:
            status = sw.status
            sw_info = {
                "name": sw.name,
                "category": sw.category.value,
                "current_version": sw.version,
                "latest_version": sw.latest_version,
                "status": status.value,
                "release_date": sw.release_date,
                "description": sw.description
            }
            results["software"].append(sw_info)

            # Actualizar resumen
            if status == SoftwareStatus.UP_TO_DATE:
                results["summary"]["up_to_date"] += 1
            elif status == SoftwareStatus.UPDATE_AVAILABLE:
                results["summary"]["update_available"] += 1
            elif status == SoftwareStatus.OUTDATED:
                results["summary"]["outdated"] += 1
            elif status == SoftwareStatus.CRITICAL:
                results["summary"]["critical"] += 1

        return results

    def scan_by_category(
        self,
        brand_name: str,
        model_name: str,
        category: SoftwareCategory
    ) -> list[dict]:
        """Escanea software de una categoría específica."""
        scan_result = self.scan_vehicle(brand_name, model_name)

        if "error" in scan_result:
            return []

        return [
            sw for sw in scan_result["software"]
            if sw["category"] == category.value
        ]

    def find_updates_needed(self, brand_name: str, model_name: str) -> list[dict]:
        """Encuentra software que necesita actualización."""
        scan_result = self.scan_vehicle(brand_name, model_name)

        if "error" in scan_result:
            return []

        return [
            sw for sw in scan_result["software"]
            if sw["status"] in [
                SoftwareStatus.UPDATE_AVAILABLE.value,
                SoftwareStatus.OUTDATED.value,
                SoftwareStatus.CRITICAL.value
            ]
        ]

    def find_critical_updates(self, brand_name: str, model_name: str) -> list[dict]:
        """Encuentra software con actualizaciones críticas."""
        scan_result = self.scan_vehicle(brand_name, model_name)

        if "error" in scan_result:
            return []

        return [
            sw for sw in scan_result["software"]
            if sw["status"] == SoftwareStatus.CRITICAL.value
        ]

    def search_software(
        self,
        query: str,
        brand_name: Optional[str] = None,
        model_name: Optional[str] = None
    ) -> list[dict]:
        """
        Busca software por nombre en toda la base de datos o filtrado.

        Args:
            query: Texto a buscar en el nombre del software
            brand_name: Filtrar por marca (opcional)
            model_name: Filtrar por modelo (opcional)

        Returns:
            Lista de coincidencias encontradas
        """
        results = []
        query_lower = query.lower()

        brands_to_search = (
            [self.get_brand(brand_name)] if brand_name
            else self.brands.values()
        )

        for brand in brands_to_search:
            if not brand:
                continue

            models_to_search = (
                [brand.get_model(model_name)] if model_name
                else brand.models
            )

            for model in models_to_search:
                if not model:
                    continue

                for sw in model.software_list:
                    if query_lower in sw.name.lower():
                        results.append({
                            "brand": brand.name,
                            "model": model.name,
                            "software": sw.name,
                            "version": sw.version,
                            "category": sw.category.value,
                            "status": sw.status.value
                        })

        return results

    def get_statistics(self) -> dict:
        """Obtiene estadísticas generales del escáner."""
        stats = {
            "total_brands": len(self.brands),
            "total_models": 0,
            "total_software": 0,
            "by_category": {},
            "by_status": {
                "up_to_date": 0,
                "update_available": 0,
                "outdated": 0,
                "critical": 0
            }
        }

        for brand in self.brands.values():
            stats["total_models"] += len(brand.models)

            for model in brand.models:
                stats["total_software"] += len(model.software_list)

                for sw in model.software_list:
                    # Contar por categoría
                    cat = sw.category.value
                    stats["by_category"][cat] = stats["by_category"].get(cat, 0) + 1

                    # Contar por estado
                    status = sw.status
                    if status == SoftwareStatus.UP_TO_DATE:
                        stats["by_status"]["up_to_date"] += 1
                    elif status == SoftwareStatus.UPDATE_AVAILABLE:
                        stats["by_status"]["update_available"] += 1
                    elif status == SoftwareStatus.OUTDATED:
                        stats["by_status"]["outdated"] += 1
                    elif status == SoftwareStatus.CRITICAL:
                        stats["by_status"]["critical"] += 1

        return stats

    def generate_report(self, brand_name: str, model_name: str) -> str:
        """
        Genera un reporte detallado del escaneo.

        Args:
            brand_name: Nombre de la marca
            model_name: Nombre del modelo

        Returns:
            Reporte formateado como string
        """
        scan = self.scan_vehicle(brand_name, model_name)

        if "error" in scan:
            return f"Error: {scan['error']}"

        lines = [
            "=" * 60,
            "REPORTE DE ESCANEO DE SOFTWARE VEHICULAR",
            "=" * 60,
            f"Marca: {scan['brand']}",
            f"Modelo: {scan['model']}",
            f"País de origen: {scan['country']}",
            f"Total de software: {scan['total_software']}",
            "",
            "RESUMEN:",
            f"  - Actualizados: {scan['summary']['up_to_date']}",
            f"  - Actualización disponible: {scan['summary']['update_available']}",
            f"  - Desactualizados: {scan['summary']['outdated']}",
            f"  - Críticos: {scan['summary']['critical']}",
            "",
            "-" * 60,
            "DETALLE DE SOFTWARE:",
            "-" * 60,
        ]

        for sw in scan["software"]:
            status_icon = {
                "Actualizado": "[OK]",
                "Actualización Disponible": "[!]",
                "Desactualizado": "[!!]",
                "Actualización Crítica": "[CRÍTICO]"
            }.get(sw["status"], "[?]")

            lines.extend([
                f"\n{status_icon} {sw['name']}",
                f"   Categoría: {sw['category']}",
                f"   Versión actual: {sw['current_version']}",
                f"   Última versión: {sw['latest_version']}",
                f"   Estado: {sw['status']}",
                f"   Fecha release: {sw['release_date']}",
            ])

            if sw["description"]:
                lines.append(f"   Descripción: {sw['description']}")

        lines.extend([
            "",
            "=" * 60,
            "Fin del reporte",
            "=" * 60
        ])

        return "\n".join(lines)
