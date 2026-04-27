#!/bin/bash

. "$HOME/.zshrc"
# ============================
# CONFIG
# ============================
DESTINO="/Users/carlosocando/Documentos/ionix/Desarrollando/todo_git/todo_git"

# Crear destino si no existe
mkdir -p "$DESTINO"

# ============================
# COPIAS
# ============================

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

echo "\n------------------------------------------------------------"
open /Users/carlosocando/Documentos/ionix/Desarrollando/todo_git/todo_git
xread "la eliminacion"
echo "eliminando ..."
rm -rf "$DESTINO"/*
rm -f "/Users/carlosocando/Documentos/ionix/Desarrollando/todo_git/todo_git/.zshrc" "/Users/carlosocando/Documentos/ionix/Desarrollando/todo_git/todo_git/.zxalias" "/Users/carlosocando/Documentos/ionix/Desarrollando/todo_git/todo_git/.zxfunction"
open /Users/carlosocando/Documentos/ionix/Desarrollando/todo_git/todo_git
echo "\n------------------------------------------------------------"
echo "\nElemntos borrados y Copia finalizada."
