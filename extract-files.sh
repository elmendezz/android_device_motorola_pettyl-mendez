#!/bin/bash
# Version: 6
# Changelog:
# - Se añadió la ruta explícita a proprietary-files.txt en la llamada a extract.
# - Se simplificó la inicialización del vendor.

export DEVICE=pettyl
export VENDOR=motorola

# Definir la raíz del proyecto (3 niveles arriba de device/motorola/pettyl)
export ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)"

# Cargar utilidades locales
if [ -f "./extract_utils.sh" ]; then
    source "./extract_utils.sh"
else
    echo "Error: Falta extract_utils.sh en la carpeta local."
    exit 1
fi

# Configurar el entorno de vendor
setup_vendor "${DEVICE}" "${VENDOR}" "${ROOT}"

# AQUÍ ESTÁ EL TRUCO: 
# Pasamos primero el archivo de la lista y luego el método (adb)
extract "${PWD}/proprietary-files.txt" "adb"

common_struct_fixup
