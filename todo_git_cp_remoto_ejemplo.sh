
CARPETA_REMOTA="/"
ARCHIVO_LOCAL="./backup.tar.gz"
REMOTO="gdrive"

echo "⏳ Subiendo ARCHIVOS a $REMOTO:$CARPETA_REMOTA ..."
rclone copy "$ARCHIVO_LOCAL" "$REMOTO":"$CARPETA_REMOTA" -P --ignore-times --progress
