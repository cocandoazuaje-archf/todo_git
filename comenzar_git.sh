# ============================================================
# LIMPIEZA LOCAL + RESPALDO A GIT
# Autor: Carlos Eduardo Ocando Azuaje
# Descripción:
#   - Ejecuta xgitall usando el mensaje recibido
#   - Luego elimina archivos y carpetas del directorio actual
#   - Conserva:
#       * Archivos/directorios que comiencen por .z
#       * Scripts .sh
#       * Directorio actual
#
# Uso:
#   script.sh "mensaje commit"
# ============================================================

# Validar parámetro obligatorio
if [ -z "$1" ]; then
  echo "❌ Uso: script.sh \"mensaje commit\""
  echo "📌 Este script realiza:"
  echo "   1. git add ."
  echo "   2. git commit -m \"mensaje\""
  echo "   3. git push"
  echo "   4. Borra archivos locales excepto:"
  echo "      - .z*"
  echo "      - *.sh"
  exit 1
fi

# Ejecutar respaldo Git completo
xgitall "$1"

# Limpiar archivos locales conservando exclusiones
find . -maxdepth 1 \
  ! -name ".z*" \
  ! -name "*.sh" \
  ! -name "." \
  -exec rm -rf {} +
