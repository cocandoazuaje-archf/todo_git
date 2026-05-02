# ============================================================
# FUNCIÓN: xclean
# DESCRIPCIÓN:Simula y
#   Elimina todos los archivos del directorio actual EXCEPTO
#   los archivos protegidos definidos manualmente.
#
# ARCHIVOS PROTEGIDOS:
#   - keep1
#   - keep2
#   - todo_git.sh
#   - tam_det.sh
#
# USO:
#   xclean
# ============================================================

# primero simula
# ------------------------

find . -maxdepth 1 \
! -name "todo_git.sh" \
! -name "tam_det.sh" \
-type f

read -p "¿Deseas continuar? (y/n): " RESPUESTA  # Aquí va el código que quieres ejecutar

if [[ "$RESPUESTA" == "n" || "$RESPUESTA" == "N" ]]; then
    echo "⚠️ Operacion abortada .... Usa y o n."
    exit 1
fi

# ahora lo hace enserio
# ---------------------------

  echo "⚠️  Limpiando directorio actual..."
  echo "📌 Archivos protegidos: keep1, keep2, todo_git.sh, tam_det.sh"
  echo ""

  # ===== VALIDACIÓN DE CONFIRMACIÓN =====
  read -p "¿Seguro que quieres eliminar TODO menos los archivos protegidos? (y/n): " CONFIRM

  if [[ "$CONFIRM" != "y" ]]; then
    echo "⛔ Operación cancelada"
    return 1
  fi

  # ===== ELIMINACIÓN SEGURA =====
  find . -maxdepth 1 \
    ! -name "todo_git.sh" \
    ! -name "tam_det.sh" \
    ! -name "." \
    -type f -delete

  echo ""
  echo "✅ Limpieza completada"

