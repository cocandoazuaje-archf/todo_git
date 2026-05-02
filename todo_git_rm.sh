# ============================================================
# FUNCIÓN: xclean
# DESCRIPCIÓN:Simula y
#   Elimina todos los archivos del directorio actual EXCEPTO
#   los archivos protegidos definidos manualmente.
#
# Accion:
#    find . -maxdepth 1 \
#       ! -name '.' \
#       ! -name 'todo*sh' \
#       -exec rm -rf {} +
#     echo "Eliminado."
# #
# USO:
#   xclean
# ============================================================

# primero simula
# ------------------------

#!/bin/zsh
find . -maxdepth 1 -mindepth 1 ! -name 'todo*.sh'

read "respuesta?¿Eliminar estos archivos? (s/n): "

if [[ "$respuesta" == "s" ]]; then
    find . -maxdepth 1 \
      ! -name '.' \
      ! -name 'todo*sh' \
      -exec rm -rf {} +
    echo "Eliminado."
else
    echo "Cancelado."
fi
