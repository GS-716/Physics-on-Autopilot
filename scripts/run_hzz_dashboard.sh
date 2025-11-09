#!/usr/bin/env bash
set -euo pipefail

NB_PATH="vendor/notebooks-collection-opendata/13-TeV-examples/uproot_python/HyyAnalysis.ipynb"
BUILD_DIR="build"   # donde se ejecuta el ipynb
SITE_DIR="docs"     # lo que se publica como Pages

rm -rf "$BUILD_DIR" && mkdir -p "$BUILD_DIR"
mkdir -p "$SITE_DIR"

echo "[INFO] Ejecutando notebook…"
papermill "$NB_PATH" "$BUILD_DIR/HyyAnalysis.executed.ipynb" \
  --request-save-on-cell-execute --progress-bar --log-output --kernel python3

echo "[INFO] Exportando a HTML…"
jupyter nbconvert --to html --output-dir "$BUILD_DIR" "$BUILD_DIR/HyyAnalysis.executed.ipynb" >/dev/null

# Copia artefactos producidos por el notebook
if [ -d "$BUILD_DIR/out" ]; then
  cp -a "$BUILD_DIR/out/." "$SITE_DIR/"
fi
# Si el notebook guardó en ./out (raíz), cópialo también:
if [ -d "out" ]; then
  cp -a "out/." "$SITE_DIR/"
fi

# Copia el HTML ejecutado
cp "$BUILD_DIR/HyyAnalysis.executed.html" "$SITE_DIR/"

# Índice simple (Markdown) enlazando todo
python - <<'PY'
from pathlib import Path
site = Path("docs"); site.mkdir(exist_ok=True)
imgs = sorted(site.glob("*.png"))
csvs = sorted(site.glob("*.csv"))
htmls = sorted(site.glob("*.html"))

with (site/"index.md").open("w", encoding="utf-8") as f:
    f.write("# Physics on Autopilot — Dashboard\n\n")
    f.write("Actualizado automáticamente con cada *push* a `main`.\n\n")

    if htmls:
        f.write("## Reportes (HTML)\n")
        for h in htmls:
            f.write(f"- [{h.name}]({h.name})\n")
        f.write("\n")

    if imgs:
        f.write("## Figuras\n")
        for p in imgs:
            f.write(f"![{p.stem}]({p.name})\n\n")

    if csvs:
        f.write("## Datos (CSV)\n")
        for c in csvs:
            f.write(f"- [{c.name}]({c.name})\n")
PY

echo "[OK] Dashboard listo en /docs"
