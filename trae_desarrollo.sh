# ============================================================
# COPIA DE ARCHIVOS HACIA DIRECTORIO PARA GIT
# Autor: Carlos Eduardo Ocando Azuaje
# Descripción:
#   - Carga funciones o variables auxiliares desde trae_zx.sh
#   - Copia recursivamente todos los archivos y directorios
#     actuales hacia ~/para_git/
# ============================================================

# Cargar configuración o utilidades externas
source ./trae_zx.sh

# Copiar todo el contenido actual de forma recursiva y verbosa
# -R : recursivo
# -v : muestra cada archivo copiado
cp -Rv * ~/para_git/

