# Physics on Autopilot (prototipo)

Repositorio para el **Reto 6: El Físico Remoto (Physics on Autopilot)** — un flujo CI/CD que, a partir de cambios en el código, ejecuta un análisis reproducible sobre **ATLAS Open Data** y publica resultados actualizados en una web estática.

## 🔗 Video del Reto 6:
[Ver demo en YouTube](https://www.youtube.com/watch?v=ALETUg37Nqc)  

> **Estado actual (prototipo):**
> - Estructura de proyecto creada.
> - Página web base lista para publicar (carpeta `docs/` o raíz, ver **Publicación web**).
> - *GitHub Actions* funcionando con un “hola mundo” (plantilla mínima).
> - Scripts y requisitos iniciales para `uproot`, `awkward`, `hist`, `matplotlib`.
> - Carpeta para vendorizar notebooks de referencia de ATLAS Open Data.

---

## Tabla de contenidos
- [Objetivo del reto](#objetivo-del-reto)
- [Arquitectura del repo](#arquitectura-del-repo)
- [Estructura de carpetas](#estructura-de-carpetas)
- [Configuración local](#configuración-local)
- [Flujo CI/CD con GitHub Actions](#flujo-cicd-con-github-actions)
- [Publicación web (GitHub Pages)](#publicación-web-github-pages)
- [Datos: ATLAS Open Data](#datos-atlas-open-data)
- [Resultados esperados](#resultados-esperados)
- [Roadmap (siguientes-pasos)](#roadmap-siguientes-pasos)
- [Créditos y contacto](#créditos-y-contacto)
- [Licencia](#licencia)
- [Video del prototipo](#video-del-prototipo)

---

## Objetivo del reto
Construir un “robot” de análisis que:
1. **Se dispare automáticamente** con cada *push* o *PR*.
2. **Descargue datos abiertos de ATLAS**, ejecute el análisis (p. ej., histograma de masa invariante).
3. **Genere y publique** gráficos/artefactos en una web estática (GitHub Pages).
4. Haga el proceso **reproducible y transparente** (ciencia abierta).

Tecnologías sugeridas: *GitHub Actions, Python (uproot, awkward-array, hist, matplotlib)* y *Docker (opcional)*.

---

## Arquitectura del repo
- **Código y pipelines**: viven en `src/` y `.github/workflows/`.
- **Datos**: se descargan dinámicamente en CI (no se versionan archivos pesados).
- **Resultados**: imágenes/artefactos se copian a `docs/` (o a la raíz) para su publicación.
- **Web**: página ligera que muestra el resultado más reciente generado por el pipeline.

---

## Estructura de carpetas
> *Estructura alineada al prototipo actual (puede variar según commits):*
