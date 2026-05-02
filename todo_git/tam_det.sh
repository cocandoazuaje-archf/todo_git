du -sm \
/Users/carlosocando/.zshrc \
/Users/carlosocando/.zxalias \
/Users/carlosocando/.zxfunction \
/Users/carlosocando/Downloads/favoritos* \
/Users/carlosocando/Downloads/glassfish7/glassfish/domains/domain1/glassfish/config/asenv.conf \
/Users/carlosocando/de_todo/cv* \
"/Users/carlosocando/Documentos/referidos_elias/referidosrrvv/imagen_respaldo" \
/Users/carlosocando/Documents/CV/paraLlorena.pdf \
/Users/carlosocando/Documentos/ionix/Desarrollando \
"/Users/carlosocando/Library/Saved Searches" \
| awk '{t+=$1; print $0} END {print "TOTAL:", t, "MB"}'
