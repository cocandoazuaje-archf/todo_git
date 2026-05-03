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

rsync -avh --progress /Users/carlosocando/Documentos/ionix/Desarrollando/* ~/para_git/

xgitall "Actualizando nuevo directorios con perfiles de usuario y datos .."
