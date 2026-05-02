#!/bin/bash
# ============================================================
# SCRIPT: Selección de tipo de respaldo
# DESCRIPCIÓN:
#   Pregunta al usuario si desea realizar respaldo para:
#   1) Google Drive
#   2) Git
#
# USO:
#   ./respaldo.sh
# ============================================================


# ============================================================
# MENÚ
# ============================================================
echo "========================================="
echo "Seleccione el tipo de respaldo:"
echo "1) Respaldo para Drive"
echo "2) Respaldo para Git"
echo "========================================="

read -p "Ingrese opción [1-2]: " OPCION


# ============================================================
# PROCESAR OPCIÓN
# ============================================================
case "$OPCION" in

    1)
        echo "Ejecutando respaldo para Drive..."
        REMOTO="gdrive"
        ARCHIVO_LOCAL="./todo_git.tar.gz"
        CARPETA_REMOTA="/todo_git"
        rclone copy "$ARCHIVO_LOCAL" "$REMOTO":"$CARPETA_REMOTA" -P --ignore-times --progress
        # Ejemplo:
        # rclone copy /ruta/origen remote:backup

        ;;

    2)
        echo "Ejecutando respaldo para Git..."
        xgittar "Actualizando git..."
        
        ;;

    *)
        echo "Opción inválida."
        echo "Uso: seleccione 1 para Drive o 2 para Git."
        exit 1
        ;;

esac


# ============================================================
# FINALIZAR
# ============================================================
echo "Proceso finalizado."
