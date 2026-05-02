#!/bin/bash
# ============================================================
# SCRIPT: Respaldo, compresión y publicación Git
# DESCRIPCIÓN:
#   Copia archivos y directorios importantes a un repositorio
#   local, genera un backup.tar.gz, elimina archivos no deseados
#   y luego ejecuta git add/commit/push.
#
# USO:
#   todo_git.sh "Mensaje del commit"
#
# EJEMPLO:
#   todo_git.sh "Backup general"
# ============================================================


# ============================================================
# VALIDAR PARÁMETRO
# ============================================================
if [ $# -lt 1 ]; then
    echo "Uso: $0 \"Mensaje del commit\""
    echo "Ejemplo: $0 \"Backup general\""
    exit 1
fi


# ============================================================
# FUNCIÓN: CREAR TAR
# ============================================================
function xxtar {

    tar -czvf todo_git.tar.gz \
        -C /Users/carlosocando .zshrc \
        -C /Users/carlosocando .zxalias \
        -C /Users/carlosocando .zxfunction \
        -C "/Users/carlosocando/Downloads" "favoritos de brave" \
        --transform 's|favoritos de brave|favoritos_brave|' \
        -C /Users/carlosocando/Downloads/glassfish7/glassfish/domains/domain1/glassfish/config asenv.conf \
        -C "/Users/carlosocando/Library" "Saved Searches" \
        --transform 's|Saved Searches|saved_searches|' \
        -C /Users/carlosocando/de_todo cv* \
        -C /Users/carlosocando/Documentos/referidos_elias/referidosrrvv imagen_respaldo \
        -C /Users/carlosocando/Documents/CV paraLlorena.pdf \
        -C /Users/carlosocando/Documentos/ionix Desarrollando \
        --transform 's|Desarrollando|desarrollando_backup|' \
        -C /Users/carlosocando/Desktop jars
}


# ============================================================
# CONFIGURACIÓN
# ============================================================
DESTINO="/Users/carlosocando/Documentos/ionix/Desarrollando/todo_git/todo_git"


# ============================================================
# CREAR DESTINO
# ============================================================
mkdir -p "$DESTINO"


# ============================================================
# COPIA DE ARCHIVOS
# ============================================================
echo "Copiando archivos..."

rsync -av --progress /Users/carlosocando/.zshrc "$DESTINO/"
rsync -av --progress /Users/carlosocando/.zxalias "$DESTINO/"
rsync -av --progress /Users/carlosocando/.zxfunction "$DESTINO/"
rsync -av --progress /Users/carlosocando/Downloads/favoritos\ de\ brave/ "$DESTINO/favoritos_brave/"
rsync -av --progress /Users/carlosocando/Downloads/glassfish7/glassfish/domains/domain1/glassfish/config/asenv.conf "$DESTINO/"
rsync -av --progress /Users/carlosocando/Library/Saved\ Searches/ "$DESTINO/saved_searches/"
rsync -av --progress /Users/carlosocando/de_todo/cv* "$DESTINO/"
rsync -av --progress /Users/carlosocando/Documentos/referidos_elias/referidosrrvv/imagen_respaldo/ "$DESTINO/imagen_respaldo/"
rsync -av --progress /Users/carlosocando/Documents/CV/paraLlorena.pdf "$DESTINO/"
rsync -av --progress /Users/carlosocando/Documentos/ionix/Desarrollando/ "$DESTINO/desarrollando_backup/"
rsync -av --progress /Users/carlosocando/Desktop/jars/ "$DESTINO/jars/"

xread "la eliminacion de los tar innecesarios.."
echo "eliminando ... tar innecesarios..."
rm *tar*

# ============================================================
# CREAR BACKUP TAR
# ============================================================
echo "\n------------------------------------------------------------"
open "$DESTINO"

xread "hacer tar ..."
xxtar


# ============================================================
# LIMPIEZA
# ============================================================
xread "la eliminacion"

echo "eliminando ..."
find . -maxdepth 1 -mindepth 1 \
  ! -name '*tar*' \
  ! -name '*sh' \
  -exec rm -rf {} +

# ============================================================
# FINALIZAR
# ============================================================
open "$DESTINO"

echo "\n------------------------------------------------------------"
echo "\nElementos borrados y copia finalizada."


source drive_git.sh
