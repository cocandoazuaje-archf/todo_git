# ============================================================
# SCRIPT: Upload de backup a almacenamiento remoto
# AUTOR: Carlos Ocando
# DESCRIPCIÓN:
#   Sube un archivo comprimido (backup.tar.gz) a un remoto
#   configurado (ej: Google Drive, S3, etc.) usando rclone.
#
# DEPENDENCIAS:
#   - rclone configurado con remoto (ej: gdrive)
#
# VARIABLES:
#   CARPETA_REMOTA → destino en el remoto
#   ARCHIVO_LOCAL  → archivo a subir
#   REMOTO         → nombre del remoto en rclone
# ============================================================

# ------------------------------------------------------------
# CONFIGURACIÓN
# ------------------------------------------------------------
CARPETA_REMOTA="/"
ARCHIVO_LOCAL="./backup.tar.gz"
REMOTO="gdrive"

# ------------------------------------------------------------
# MENSAJE DE INICIO
# ------------------------------------------------------------
echo "================================================"
echo "        INICIANDO SUBIDA DE BACKUP"
echo "================================================"
echo "⏳ Subiendo ARCHIVO a $REMOTO:$CARPETA_REMOTA ..."
echo "📦 Archivo local: $ARCHIVO_LOCAL"
echo "☁️  Destino remoto: $REMOTO:$CARPETA_REMOTA"
echo "================================================"

# ------------------------------------------------------------
# VALIDACIÓN DE ARCHIVO
# ------------------------------------------------------------
if [[ ! -f "$ARCHIVO_LOCAL" ]]; then
  echo "❌ ERROR: El archivo no existe: $ARCHIVO_LOCAL"
  exit 1
fi

# ------------------------------------------------------------
# SUBIDA CON RCLONE
# ------------------------------------------------------------
rclone copy "$ARCHIVO_LOCAL" "$REMOTO:$CARPETA_REMOTA" --progress

# ------------------------------------------------------------
# VALIDACIÓN DE RESULTADO
# ------------------------------------------------------------
if [[ $? -eq 0 ]]; then
  echo ""
  echo "✅ Backup subido correctamente a $REMOTO:$CARPETA_REMOTA"
else
  echo ""
  echo "❌ ERROR: Falló la subida del backup"
  exit 1
fi

rclone copy "$ARCHIVO_LOCAL" "$REMOTO":"$CARPETA_REMOTA" -P --ignore-times --progress

# ------------------------------------------------------------
# FIN DEL SCRIPT
# ------------------------------------------------------------
echo "================================================"
echo "              PROCESO TERMINADO"
echo "================================================"
