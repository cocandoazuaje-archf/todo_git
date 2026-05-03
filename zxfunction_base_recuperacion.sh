#!/bin/bash
# ============================================================
# FUNCIONES PERSONALIZADAS DE UTILIDAD PARA TERMINAL
# ============================================================

# ===== CONSTANTES =====
FUENTES="/Users/carlosocando/Documentos/referidos_elias/1.0-war"
TARGE="$FUENTES/target"
WAR_PATH="$TARGET/$WAR"
ASADMIN="/Users/carlosocando/Downloads/glassfish7/glassfish8/glassfish/bin/asadmin"
GLAS="http://localhost:4848/common/applications/applications.jsf"
PROJECTO_SIN_EXTENCION="referidosrrvv-1.0"
EXTENCION_WAR="war"
WAR="$PROJECTO_SIN_EXTENCION"."$EXTENCION_WAR"
ENTER="**** Presione ENTER para "
USERS='~/'
RED="\033[1;31m"
RESET="\033[0m"

#!/bin/bash
# ============================================================
# FUNCIONES PERSONALIZADAS DE UTILIDAD PARA TERMINAL
# ============================================================

# ===== CONSTANTES =====
FUENTES="/Users/carlosocando/Documentos/referidos_elias/1.0-war"
TARGE="$FUENTES/target"
WAR_PATH="$TARGET/$WAR"
ASADMIN="/Users/carlosocando/Downloads/glassfish7/glassfish8/glassfish/bin/asadmin"
GLAS="http://localhost:4848/common/applications/applications.jsf"
PROJECTO_SIN_EXTENCION="referidosrrvv-1.0"
EXTENCION_WAR="war"
WAR="$PROJECTO_SIN_EXTENCION"."$EXTENCION_WAR"
ENTER="**** Presione ENTER para "
USERS='~/'
RED="\033[1;31m"
RESET="\033[0m"



# ____________________________________________________________
# VALIDAR COMANDO
# ____________________________________________________________
function xfind {
  echo "**** Procesando ..."
  if ! command -v "$1" >/dev/null 2>&1; then
    echo "❌ Dependencia faltante: $1"
    return 1
  fi
}

# ____________________________________________________________
# FIND
# ____________________________________________________________
function xfind {

  # Validar primer parámetro
  if [ -z "$1" ]; then
    echo "Uso: xfind <archivo> [texto_a_filtrar]"
    return 1
  fi

  # Si no se pasa $2, pedirlo interactivo
  if [ -z "$2" ]; then
    read "filtro?**** Ingrese texto para filtrar resultados (Enter para omitir): "
  else
    filtro="$2"
  fi

  # Buscar archivos
  if [ -n "$filtro" ]; then
    echo "**** Buscando .."

    archivos=$(sudo find  . -type f -name "$1" 2>/dev/null | grep -i --color=always -F "$filtro")
  else
    archivos=$(sudo find  . -type f -name "$1" 2>/dev/null)
  fi

  # Guardar resultados
  echo "$archivos" > /tmp/xfind.txt

  echo -e "\n**** Resultados encontrados:"
  echo "$archivos"

  echo -e "\n**** cmd + ctrl + G / (Busca: $1)"
  [ -n "$filtro" ] && echo "**** Filtro aplicado: $filtro"

  echo "**** archivos encontrados: $(echo "$archivos" | wc -l | tr -d ' ')"

  # Abrir en Sublime Text
  subl /tmp/xfind.txt
}

# ------------------------------------------------------------
# KEEP
# ------------------------------------------------------------
function xkeepz {
  pbcopy < ~/.zshrc
  open "https://keep.google.com/u/0/#NOTE/1cHY3dqr_pplDokRVaP79pV0zGYsWguTSj8EMpmlXbPeSmHTgMgNua-exwhfhG9I"
}

function xkeeps {
 open "x-apple.systempreferences:com.apple.preference.keyboard"
 cat "/Users/carlosocando/de_todo/Sustituciones de texto.plist"|pbcopy && open https://keep.google.com/u/0/#NOTE/1y0Kv4i0UsOA7jgni1XGqdbvUaatlLr7PGKy1OMztdc5vaob3tP2PyibmBCZy8Wo

}

function xkeepa {
  pbcopy < ~/.zxalias
  open "https://keep.google.com/u/0/#NOTE/19Up941HW3Lz3Wus5YLUA3tWAK8nSCd297uMbPzmbDQAAnLCkGg8ZoHverMFXBQ"
}

function xkeepg {
  pbcopy < ~/xglasmenu.sh
  open "https://keep.google.com/u/0/#NOTE/1dzBq4kCvpda6GNHBjVAfIC-Lp4-TUN2_Mzyv68xzkHItDA6NYmUdZIeU9_-4lDE"
}
function xkeepf {
  pbcopy < ~/.zxfunction
  open "https://keep.google.com/u/0/#NOTE/1O8QXdPmSMGasEnlwymtrradJ7mK-7QdzUwKAMSH3IGZDrDdmUg7W8_pu_TsdKpg"
}


# ____________________________________________________________
# FD / GREP
# ____________________________________________________________
function xfd2 {
  echo "**** Procesando ..."

  if [ $# -lt 2 ]; then
    echo "Uso: xfd2 <patron1> <patron2>"
    return 1
  fi

  grep -R -i -E "$1|$2" . > /tmp/xfd2.txt
  subl /tmp/xfd2.txt
}

function xfd {
  echo "**** Procesando ..."
  require_cmd fd -H || return 1

  if [ $# -eq 0 ]; then
    echo "Uso: xfd <patron>"
    return 1
  fi

  fd -i "$1" > /tmp/xfd.txt
  subl /tmp/xfd.txt
}

# ____________________________________________________________
# FINDER
# ____________________________________________________________
function xfinder {
  echo "**** Procesando ..."

  RUTA="${1:-$PWD}"

  if [ ! -d "$RUTA" ]; then
    echo "❌ Ruta no válida: $RUTA"
    return 1
  fi

  open "$RUTA"
}

# ____________________________________________________________
# LISTADO
# ____________________________________________________________
function xll() {
    command ls -lahSr "${1:-.}"
    builtin pwd
}

function ll {
  xll "$1"

}


# ____________________________________________________________
# RED
# ____________________________________________________________
function xip {
  while true; do
    clear
    echo "**** Informacion sobre ips"

    echo -e "\033[1;32mPublica:\033[0m $(curl -s ifconfig.me)"
    echo -e "\033[1;34mLocal:\033[0m $(ipconfig getifaddr en0)"
    echo -e "\033[1;31mGateway:\033[0m $(route -n get default | awk '/gateway/ {print $2}')"

    sleep 5
  done
}

# ____________________________________________________________
# HISTORIAL
# ____________________________________________________________
function xchis {
  if [ -z "$1" ]; then
    history
  else
    history | grep -i --color=auto "$1"
  fi
}


function xchx {
  [[ -z "$1" ]] && echo "Uso: xchx <archivo>" && return 1
  [[ ! -f "$1" ]] && echo "No existe: $1" && return 1

  chmod +x "$1"
  ls -lah "$1"
  pwd
}


function xlogs
  LOGFILE="$1"
  PATTERN="$2"

  if [[ ! -f "$LOGFILE" ]]; then
    echo "Archivo no encontrado: $LOGFILE"
    return 1
  fi

  if [[ -z "$PATTERN" ]]; then
    tail -n 50 "$LOGFILE"
  else
    grep -i --color=always "$PATTERN" "$LOGFILE" | less -R
  fi
}

# ____________________________________________________________
# BRAVE
# ____________________________________________________________
function xbrave {
  if [ -z "$1" ]; then
    echo "Uso: x-brave <url>"
    return 1
  fi

  local url="$1"

  [[ ! "$url" =~ ^https?:// ]] && url="https://$url"

  if [[ "$OSTYPE" == "darwin"* ]]; then
    open -a "Brave Browser" "$url"
  else
    echo "No soportado en este sistema"
  fi
}

# ____________________________________________________________
# GLASSFISH
# ____________________________________________________________
function xglason {
  ASADMIN="/Users/carlosocando/Downloads/glassfish7/glassfish8/glassfish/bin/asadmin"

  if [ "$1" == "1" ]; then
    sh "$ASADMIN" start-domain
  fi
}

function xglasoff {
  ASADMIN="/Users/carlonsocando/Downloads/glassfish7/glassfish8/glassfish/bin/asadmin"

  if [ -z "$1" ]; then
    sh "$ASADMIN" stop-domain
  fi
}

# ____________________________________________________________
# GIT
# ____________________________________________________________
function xgit_all {
  git add . && git commit -m "$1" && git push
}

# ____________________________________________________________
# TAR
# ____________________________________________________________
function xtar {
  ORIGEN="$1"
  DESTINO="${1}.tar.gz"

  if [ -z "$ORIGEN" ]; then
    echo "Uso: xtar <archivo|carpeta>"
    return 1
  fi

  tar -czvf "$DESTINO" "$ORIGEN"

  if [ $? -eq 0 ]; then
    echo "✔ Creado: $DESTINO"
  else
    echo "❌ Error al crear"
  fi
}



function xcd_git {
  cd "$WAR_1_0"  || return 1
  ls -ha
  pwd

}

function go_project {
 echo ""$ENTER" hacer cd ... \n" < /dev/tty
 cd "$WAR_1_0" || return 1
 ls -ha
 pwd

}

function build_project {
 echo ""$ENTER" package ... \n" < /dev/tty
 mvn clean package -X
}

undeploty_project() {
  ""$ENTER" undeploy ... \n" < /dev/tty
  "$ASADMIN" undeploy "$PROJECTO_SIN_EXTENCION"
}

function deploy_project {
 ""$ENTER" deploy ... \n" < /dev/tty
 "$ASADMIN" deploy "$PROJECTO_SIN_EXTENCION"

 ""$ENTER" deploy ... \n" < /dev/tty
 "$ASADMIN" deploy \
 --force=true \
 "$TARGE"/"$PROJECTO_SIN_EXTENCION"."$EXTENCION_WAR"

}

function remove_war {
 echo ""$ENTER" rm ... \n" < /dev/tty
 rm "$ASADMIN"/"$PROJECTO_SIN_EXTENCION"."$EXTENCION_WAR"


}

function xsubir {
  xglasoff
  xglason
  go_project
  open "$TARGET"
  build_project
  undeploy_project
  open "$GLAS"
  deploy_project
  open "$GLAS"
}

function xpausa {
  if [[ -z "$1" ]]; then
    echo "Uso: pausa <segundos>"
    return 1
  fi

  if ! [[ "$1" =~ ^[0-9]+$ ]]; then
    echo "Error: debes pasar un número entero"
    return 1
  fi

  echo "⏸ Pausando $1 segundo(s)..."grep
  sleep "$1"
}


function xgrep {
  echo "**** Procesando  ..."
  sudo grep -Rni "$1" . 2>/dev/null > /tmp/xgrep.txt
  echo "\n-----------------------------------------------------------" >> /tmp/xgrep.txt
  ls >> /tmp/xgrep.txt
  echo "-------------------------------------------------------------" >> /tmp/xgrep.txt
  pwd  >> /tmp/xgrep.txt
  echo "-------------------------------------------------------------" >> /tmp/xgrep.txt
  echo "**** Proceso finalizado ..." >> /tmp/xgrep.txt
  subl  /tmp/xgrep.txt

}

function xcompare {
  # Comparación
  if [ "$1" = "$2" ]; then
    echo "**** Son iguales"
  else
    echo "**** Son diferentes"
  fi

}

function xcomparex {
  valor1=$(zenity --entry --title="Comparación" --text="Ingrese el primer valor:" 2>/dev/null ) || return 1
  valor2=$(zenity --entry --title="Comparación" --text="Ingrese el segundo valor:" 2>/dev/null ) || return 1

  if [ -z "$valor1" ] || [ -z "$valor2" ]; then
    zenity --warning --title="Error" --text="No puedes dejar campos vacíos" 2>/dev/null
    return 1
  fi

  if [ "$valor1" = "$valor2" ]; then
    zenity --info --title="Resultado" --text="Son iguales"  2>/dev/null
  else
    zenity --error --title="Resultado" --text="Son diferentes" 2>/dev/null
  fi
}


function xinsjav {
  # =========================================================
# Script: install_java.sh
# Descripción:
#   Instala OpenJDK vía brew, configura JAVA_HOME
#   y verifica la instalación.
#
# Uso:
#   ./install_java.sh <version>
#
# Ejemplo:
#   ./install_java.sh 17
# =========================================================

# set -e

# -------------------------
# Validación de parámetros
# -------------------------
if [ -z "$1" ]; then
  echo "❌ Error: Debes indicar la versión de Java."
  echo ""
  echo "Uso:"
  echo "  ./install_java.sh <version>"
  echo ""
  echo "Ejemplo:"
  echo "  ./install_java.sh 17"


  # parte 1

  echo ""
  echo "Esto instalará OpenJDK 17 y configurará JAVA_HOME."
  return 1
fi

JAVAVER="$1"

echo "🔧 Instalando OpenJDK $JAVAVER ..."

# -------------------------
# Verificar brew
# -------------------------
if ! command -v brew >/dev/null 2>&1; then
  echo "❌ Homebrew no está instalado."
  echo "Instálalo desde: https://brew.sh"
  return 1
fi

# -------------------------
# Instalar OpenJDK
# -------------------------
if [ "$2" = "r" ]; then
  echo "**** Re-instalando ..."
  brew reinstall openjdk@"$JAVAVER"
else
  echo "**** Instalando ..."
  brew install openjdk@"$JAVAVER"
fi


# -------------------------
# Configurar JAVA_HOME
# -------------------------
echo "⚙️ Configurando JAVA_HOME en ~/.zshrc ..."

# Evitar duplicados
  if ! grep -q "java_home -v $JAVAVER" ~/.zshrc; then
  echo "" >> ~/.zshrc
  echo "# Java $JAVAVER" >> ~/.zshrc
  echo "export JAVA_HOME=\$(/usr/libexec/java_home -v $JAVAVER)" >> ~/.zshrc
  echo 'export PATH=$JAVA_HOME/bin:$PATH' >> ~/.zshrc
fi

# -------------------------
# Aplicar cambios
# -------------------------
source ~/.zshrc

# -------------------------
# Verificación
# -------------------------
echo "✅ Java instalado:"
java -version

echo ""
echo "🎯 JAVA_HOME actual:"
echo "$JAVA_HOME"

}

function xunsjav {

  # =========================================================
  # FUNCIÓN: xcleanjava
  # DESCRIPCIÓN:
  #   Elimina versiones de OpenJDK instaladas vía Homebrew
  #   y limpia completamente residuos del sistema.
  #
  # USO:
  #   xcleanjava <version1> <version2>
  #
  # EJEMPLO:
  #   xcleanjava 21 17
  #
  # NOTA:
  #   - version1 se elimina forzado (--ignore-dependencies)
  #   - version2 eliminación estándar
  #   - elimina caches, binarios y restos manuales
  # =========================================================

  # -------------------------
  # Validación de parámetros
  # -------------------------
  if [ -z "$1" ] || [ -z "$2" ]; then
    echo "❌ Debes indicar dos versiones de Java a eliminar."
    echo ""
    echo "Uso:"
    echo "  xcleanjava <version1> <version2>"
    echo ""
    echo "Ejemplo:"
    echo "  xcleanjava 21 17"
    echo ""
    echo "Esto eliminará:"
    echo "  - openjdk@<version1> (forzado)"
    echo "  - openjdk@<version2>"
    echo "  - caches y restos de instalación"
    return 0
  fi

  JDK1="$1"
  JDK2="$2"

  echo "🔍 JDKs instalados:"
  brew list | grep openjdk || true
  echo ""

  # -------------------------
  # Confirmación
  # -------------------------
  read "?⚠️ Esto eliminará versiones de Java. ¿Continuar? (y/N): " confirm
  if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
    echo "****❌Operación cancelada ..."
    return 0
  fi

  # -------------------------
  # Desinstalar JDKs
  # -------------------------
  echo "**** Eliminando openjdk@$JDK1 (forzado)..."
  brew uninstall --ignore-dependencies openjdk@"$JDK1" || true

  echo "🗑**** Eliminando openjdk@$JDK2 ..."
  brew uninstall openjdk@"$JDK2" || true

  echo "****🧹Limpieza de brew..."
  brew cleanup

  # -------------------------
  # Limpieza manual
  # -------------------------
  echo "🧹**** Eliminando restos ..."

  rm -rf ~/.java
  rm -rf ~/.jdk

  rm -rf /opt/homebrew/opt/openjdk*
  rm -rf /opt/homebrew/Cellar/openjdk*
  rm -rf /opt/homebrew/Cellar/openjdk@*

  rm -f /opt/homebrew/bin/java
  rm -f /opt/homebrew/bin/javac

  rm -rf ~/Library/Caches/Homebrew/downloads/*openjdk*

  echo "🧹**** Eliminando plugin antiguo (requiere sudo) ..."
  sudo rm -rf "/Library/Internet Plug-Ins/JavaAppletPlugin.plugin" 2>/dev/null || true

sudo ln -sfn /opt/homebrew/opt/openjdk@"$1"/libexec/openjdk.jdk \
/Library/Java/JavaVirtualMachines/openjdk-"$1".jdk

java --version

  echo "\n-------------------------------------------------------------------------------------"
  echo "**** Limpieza completada. Verifica con 'java -version' y 'brew list | grep openjdk'. .."
}

function xuniglas {

  # =========================================================
  # FUNCIÓN: xunsglas
  # DESCRIPCIÓN:
  #   Elimina completamente instalaciones de GlassFish
  #   ubicadas en el directorio home del usuario.
  #
  # USO:
  #   xunsglas
  #
  # NOTA:
  #   - Borra cualquier carpeta que coincida con ~/glassfish*
  #   - Acción irreversible
  #   - Requiere confirmación del usuario
  # =========================================================

  echo "⚠️ Se eliminarán todas las carpetas ~/glassfish*"
  read "?¿Estás seguro? (y/N): " confirm

  if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
    echo "❌ Operación cancelada"
    return 0
  fi

  rm -rf ~/glassfish*

  echo "✅ GlassFish eliminado correctamente"
}

function xkkill {
lsof -P | grep -i ':$1' | awk '{print $2}'| xargs kill -9
}

# =========================================================
# TÍTULO: xkill - Finalizar procesos por puerto
# DESCRIPCIÓN:
#   Mata todos los procesos que estén utilizando un puerto
#   específico en el sistema.
#
# USO:
#   xkill <puerto>
#
# EJEMPLO:
#   xkill 8080
#
# NOTA:
#   Si no se entrega el parámetro, muestra ayuda de uso.
# =========================================================

function xkill {

    # Si no recibe parámetros, muestra ayuda y sale
    if [ -z "$1" ]; then
        echo "======================================"
        echo "Uso: xkill <puerto>"
        echo "Ejemplo: xkill 8080"
        echo "======================================"
        return 1
    fi

    # Obtiene los PID asociados al puerto indicado
    pids=$(lsof -P | grep -i ":$1" | awk '{print $2}')

    # Si no hay procesos, informa y sale
    if [ -z "$pids" ]; then
        echo "No hay procesos usando el puerto $1"
        return 0
    fi

    # Muestra y termina los procesos encontrados
    echo "Matando procesos en puerto $1: $pids"
    echo "$pids" | xargs kill -9
}

# =========================================================
# TÍTULO: xcdlogs - Ir a logs de GlassFish domain1
# DESCRIPCIÓN:
#   Navega directamente al directorio de logs del dominio
#   domain1 de GlassFish.
#
# USO:
#   xcdlogs
#
# NOTA:
#   No recibe parámetros. Cualquier intento de uso con
#   parámetros será ignorado y se mostrará ayuda.
# =========================================================

function xcdlogs {

    # Si se intenta pasar algún parámetro, muestra ayuda y sale
    if [ "$#" -ne 0 ]; then
        echo "======================================"
        echo "Uso: xcdlogs"
        echo "Este comando NO recibe parámetros"
        echo "Ejemplo:"
        echo "  xcdlogs"
        echo "======================================"
        return 1
    fi

    # Directorio destino
    DIR="/Users/carlosocando/Downloads/glassfish7/glassfish/domains/domain1/applications/glassfish/domains/domain1/logs"

    # Validación de existencia del directorio
    if [ ! -d "$DIR" ]; then
        echo "Error: no existe el directorio:"
        echo "$DIR"
        return 1
    fi

    # Cambio de directorio
    cd "$DIR" || return
}

# =========================================================
# TÍTULO: xcdconf - Ir al directorio de configuración GlassFish
# DESCRIPCIÓN:
#   Navega directamente al directorio de configuración (config)
#   del dominio domain1 de GlassFish.
#
# USO:
#   xcdconf
#
# NOTA:
#   No recibe parámetros. Si se envía alguno, muestra ayuda.
# =========================================================

function xcdconf {

    # No acepta parámetros
    if [ "$#" -ne 0 ]; then
        echo "======================================"
        echo "Uso: xcdconf"
        echo "Este comando NO recibe parámetros"
        echo "Ejemplo:"
        echo "  xcdconf"
        echo "======================================"
        return 1
    fi

    # Directorio de configuración de GlassFish
    DIR="/Users/carlosocando/Downloads/glassfish7/glassfish8/glassfish/domains/domain1/config"

    # Validación de existencia del directorio
    if [ ! -d "$DIR" ]; then
        echo "Error: no existe el directorio:"
        echo "$DIR"
        return 1
    fi

    # Cambio de directorio
    cd "$DIR" || return
}


# ============================================================
# FUNCIÓN: xclose
# DESCRIPCIÓN:
# Cierra una aplicación por nombre (proceso)
#
# USO:
#   xclose nombre_app
# ============================================================

function xclose {

  # Validación: debe venir el nombre del proceso
  if [ -z "$1" ]; then
    echo "Uso: xclose nombre_app"
    echo ""
    echo "Ejemplos:"
    echo "  xclose code"
    echo "  xclose java"
    echo "  xclose chrome"
    return 1
  fi

  local app="$1"

  echo "🔎 Buscando procesos de: $app"

  # Obtener PIDs
  local pids=$(pgrep -f "$app")

  if [ -z "$pids" ]; then
    echo "⚠️ No se encontraron procesos para: $app"
    return 1
  fi
  echo "**** Proceso terminado ... "

  }

function xgitall {

    # Validar parámetro
    if [ -z "$1" ]; then
        echo "======================================"
        echo "USO:"
        echo "  xgitall \"mensaje del commit\""
        echo ""
        echo "Ejemplo:"
        echo "  xgitall sin mensaje hace : "
        echo "echo git add . "
        echo "git commit -m "$1" "
        echo "git push "
        echo "git status "
        echo "git log "
        echo "git branch "
        echo "======================================"
        return 1
    fi

    git add . && \
    git commit -m "$1" && \
    git push && \
    git status && \
    git log -1 && \
    git branch -vv
}

# ============================================================
# FUNCIÓN: cread
# DESCRIPCIÓN:
#   Función envoltorio de `read` en bash.
#   - Recibe como parámetro un mensaje a mostrar.
#   - Si no recibe parámetros, muestra cómo usarla.
#   - Redirige errores a /dev/null.
#   - Guarda la salida en /tmp/cread.txt.
#   - Abre el archivo con Visual Studio code (code).
# ============================================================

function xread {

    read "confirm? \nPresione ENTER para continuar con $1 ..."
}

function xkeepall {
  xread "el siguiente paso para alias"
  xkeepa
  xread "el siguiente paso para funciones"
  xkeepf
  xread "el siguiente paso para sustituciones de texto"
  xkeeps
  xread "el siguiente paso para git"
  xkeepg
  xread "el siguiente paso para zshrc"
  xkeepz

}


 function xxlsglas {
    rm -rf ~/Library/Caches/BraveSoftware/Brave-Browser/*
    rm -rf ~/Library/Application\ Support/BraveSoftware/Brave-Browser/Default/Cache/*
    mvn clean package \
    && /Users/carlosocando/Downloads/glassfish7/glassfish/domains/domain1/bin/asadmin deploy --force target/"$1" \
    && open http://www.localhost:4848/common/index.jsf

  }

  function xcd {
    pushd "$1"
    ll
    pwd
  }


  function xmvnglas {
    mvn clean package \
      && /Users/carlosocando/Downloads/glassfish7/glassfish/domains/domain1/bin/asadmin undeploy \
    "$1" ; open http://localhost:4848/common/index.jsf \
    && xread "continuar ..." \
    && /Users/carlosocando/Downloads/glassfish7/glassfish/domains/domain1/bin/asadmin deploy \
    --force target/"$1" \
    && open http://localhost:4848/common/index.jsf
  }

# ============================================================
# FUNCIÓN: xdif
# DESCRIPCIÓN:
#   Compara dos archivos usando diff en formato unified (-u),
#   guarda el resultado en /tmp/xdif.txt y lo abre con Sublime Text.

# parte 2

function#
# USO:
#   xdif archivo1 archivo2
#
# EJEMPLO:
#   xdif cp_remote.sh cp_remoto.sh
# ============================================================

function xdif {

    # Validar cantidad de parámetros
    if [ $# -ne 2 ]; then
        echo "Uso: xdif <archivo1> <archivo2>"
        echo "Ejemplo: xdif cp_remote.sh cp_remoto.sh"
        return 1
    fi

    # Variables
    local ARCHIVO1="$1"
    local ARCHIVO2="$2"
    local SALIDA="/tmp/xdif.txt"

    # Validar existencia
    if [ ! -f "$ARCHIVO1" ]; then
        echo "Error: No existe '$ARCHIVO1'"
        return 1
    fi

    if [ ! -f "$ARCHIVO2" ]; then
        echo "Error: No existe '$ARCHIVO2'"
        return 1
    fi

    # Ejecutar diff
    diff -u "$ARCHIVO1" "$ARCHIVO2" > "$SALIDA"

    # Confirmar resultado
    echo "Diff guardado en: $SALIDA"

    # Abrir en Sublime Text
    subl "$SALIDA"
}


# ============================================================
# FUNCIÓN: xdictado
# DESCRIPCIÓN:
#   Abre Configuración del Sistema en la sección Teclado
#   e indica que la opción buscada está dentro de Teclado.
#
# USO:
#   xdictado
# ============================================================

function dictado {
    open "/Users/carlosocando/Desktop/Captura de pantalla 2026-04-28 a las 3.21.38 p.m..png"

    echo "**** La opción se encuentra dentro de:"
    echo "     Configuración del Sistema > Teclado"
    xread "continuar con el sistema .."

    open "x-apple.systempreferences:com.apple.Keyboard-Settings.extension"
}


# ============================================================
# FUNCIÓN: xmvnglas
# DESCRIPCIÓN:
#   Compila proyecto Maven, genera WAR, despliega en GlassFish
#   y abre consola administrativa.
#
# USO:
#   xmvnglas nombre-del-war
#
# EJEMPLO:
#   xmvnglas referidos
# ============================================================

function xmvnglas() {

    # Validar parámetro
    if [[ -z "$1" ]]; then
        echo "=================================================="
        echo "USO:"
        echo "  xmvnglas nombre-del-war"
        echo ""
        echo "EJEMPLO:"
        echo "  xmvnglas referidos"
        echo ""
        echo "DESCRIPCIÓN:"
        echo "  - Ejecuta mvn clean package"
        echo "  - Despliega target/nombre-del-war.war en GlassFish"
        echo "  - Fuerza redeploy"
        echo "  - Abre consola administrativa"
        echo "=================================================="
        return 1
    fi

    # Variables
    local WAR_NAME="$1"
    local GLASSFISH_ASADMIN="/Users/carlosocando/Downloads/glassfish7/glassfish/domains/domain1/bin/asadmin"
    local WAR_PATH="target/${WAR_NAME}"

    # Validar existencia del WAR tras compilación
    echo "=================================================="
    echo "Compilando proyecto con Maven..."
    echo "=================================================="

    mvn clean package || {
        echo "❌ Error: Falló compilación Maven."
        return 1
    }

    if [[ ! -f "$WAR_PATH" ]]; then
        echo "❌ Error: No se encontró el archivo $WAR_PATH"
        return 1
    fi

    echo "=================================================="
    echo "Desplegando $WAR_PATH en GlassFish..."
    echo "=================================================="

    "$GLASSFISH_ASADMIN" deploy --force "$WAR_PATH" || {
        echo "❌ Error: Falló despliegue en GlassFish."
        return 1
    }

    echo "=================================================="
    echo "Abriendo consola de administración..."
    echo "=================================================="

    open "http://localhost:4848/common/index.jsf"

    echo "✅ Deploy completado correctamente."
}


function xdepen {


}


# ============================================================
# FUNCIÓN: xdepen
# DESCRIPCIÓN:
#   Instala manualmente un archivo JAR en el repositorio local
#   de Maven usando parámetros.
#
# USO:
#   xdepen <ruta_jar> <groupId> <artifactId> [version] [packaging]
#
# EJEMPLO:
#   xdepen /Users/carlosocando/Desktop/jars/encriptar-1.0.jar cl.cnsv.crypto encryption 1.0 jar
# ============================================================

function xdepen() {

    # Si no recibe parámetros suficientes, mostrar ayuda
    if [[ $# -lt 3 ]]; then
        echo "=================================================="
        echo "USO:"
        echo "  xdepen <ruta_jar> <groupId> <artifactId> [version] [packaging]"
        echo ""
        echo "PARÁMETROS:"
        echo "  ruta_jar     Ruta completa del archivo .jar"
        echo "  groupId      Identificador del grupo"
        echo "  artifactId   Nombre del artefacto"
        echo "  version      Versión (default: 1.0)"
        echo "  packaging    Tipo de paquete (default: jar)"
        echo ""
        echo "EJEMPLO:"
        echo "  xdepen /Users/carlosocando/Desktop/jars/encriptar-1.0.jar cl.cnsv.crypto encryption 1.0 jar"
        echo "=================================================="
        return 1
    fi

    local FILE_PATH="$1"
    local GROUP_ID="$2"
    local ARTIFACT_ID="$3"
    local VERSION="${4:-1.0}"
    local PACKAGING="${5:-jar}"

    # Validar existencia del archivo
    if [[ ! -f "$FILE_PATH" ]]; then
        echo "❌ Error: Archivo no encontrado -> $FILE_PATH"
        return 1
    fi

    echo "=================================================="
    echo "INSTALANDO DEPENDENCIA MAVEN"
    echo "=================================================="
    echo "Archivo:     $FILE_PATH"
    echo "GroupId:     $GROUP_ID"
    echo "ArtifactId:  $ARTIFACT_ID"
    echo "Version:     $VERSION"
    echo "Packaging:   $PACKAGING"
    echo "=================================================="

    mvn install:install-file \
      -Dfile="$FILE_PATH" \
      -DgroupId="$GROUP_ID" \
      -DartifactId="$ARTIFACT_ID" \
      -Dversion="$VERSION" \
      -Dpackaging="$PACKAGING"

    if [[ $? -eq 0 ]]; then
        echo "✅ Dependencia instalada correctamente."
    else
        echo "❌ Error durante instalación Maven."
        return 1
    fi
}

# ============================================================
# FUNCIÓN: xgdriveup
# DESCRIPCIÓN:
#   Sube archivos a Google Drive usando rclone,
#   preguntando después de cada subida si deseas continuar.
#
# REQUISITOS:
#   - Tener rclone instalado
#   - Tener configurado remote "gdrive"
#
# USO:
#   xgdriveup
# ============================================================

function xdriveup() {

    # Validar parámetros
    if [[ $# -ne 0 ]]; then
        echo "=================================================="
        echo "USO:"
        echo "  xgdriveup"
        echo ""
        echo "DESCRIPCIÓN:"
        echo "  Sube archivos a Google Drive uno por uno."
        echo "  Después de cada archivo pregunta si deseas subir otro."
        echo ""
        echo "CUENTA:"
        echo "  cocandoazuaje@gmail.com"
        echo ""
        echo "REMOTE:"
        echo "  gdrive"
        echo "=================================================="
        return 1
    fi

    local FILE_PATH
    local FILE_NAME
    local RESPUESTA

    echo "=================================================="
    echo "SUBIDA INTERACTIVA A GOOGLE DRIVE"
    echo "Cuenta: cocandoazuaje@gmail.com"
    echo "Destino: gdrive:/"
    echo "=================================================="

    while true; do

        # Solicitar archivo
        echo ""
        read "FILE_PATH?Ruta completa del archivo a subir: "

        # Validar existencia
        if [[ ! -f "$FILE_PATH" ]]; then
            echo "❌ Error: Archivo no encontrado."
            continue
        fi

        FILE_NAME=$(basename "$FILE_PATH")

        echo "--------------------------------------------------"
        echo "Subiendo: $FILE_NAME"
        echo "--------------------------------------------------"

        echo "Subiendo $FILE_NAME" ...""
        rclone copy "$FILE_PATH" gdrive:/

        if [[ $? -eq 0 ]]; then
            echo "✅ Archivo subido correctamente: $FILE_NAME"
        else
            echo "❌ Error durante subida."
        fi

        # Preguntar continuación
        while true; do
            echo ""
            read "RESPUESTA?¿Deseas subir otro archivo? (s/n): "

            case "$RESPUESTA" in
                s|S)
                    break
                    ;;
                n|N)
                    echo "=================================================="
                    echo "Proceso finalizado."
                    echo "=================================================="
                    return 0
                    ;;
                *)
                    echo "⚠️ Respuesta inválida. Usa s o n."
                    ;;
            esac
        done

    done
}

# ============================================================
# FUNCIÓN: xtart
# DESCRIPCIÓN:
#   Lista el contenido interno de archivos TAR/TAR.GZ/TGZ
#   usando:
#     tar -tf
#
# USO:
#   xtart <archivo_tar>
#
# EJEMPLO:
#   xtart todo_git.tar.gz
# ============================================================

function xtart() {

    # Validar parámetro
    if [[ $# -lt 1 ]]; then
        echo "=================================================="
        echo "FUNCIÓN: xtart"
        echo "=================================================="
        echo "DESCRIPCIÓN:"
        echo "  Muestra el contenido interno de archivos comprimidos:"
        echo "   - .tar"
        echo "   - .tar.gz"
        echo "   - .tgz"
        echo "   - .tar.bz2"
        echo ""
        echo "COMANDO UTILIZADO:"
        echo "  tar -tf <archivo>"
        echo ""
        echo "USO:"
        echo "  xtart <archivo_tar>"
        echo ""
        echo "EJEMPLO:"
        echo "  xtart todo_git.tar.gz"
        echo "=================================================="
        return 1
    fi

    local TAR_FILE="$1"

    # Validar existencia
    if [[ ! -f "$TAR_FILE" ]]; then
        echo "❌ Error: Archivo no encontrado -> $TAR_FILE"
        return 1
    fi

    echo "=================================================="
    echo "LISTANDO CONTENIDO:"
    echo "  $TAR_FILE"
    echo "=================================================="

    tar -tf "$TAR_FILE" | grep -i "$2"

    if [[ $? -ne 0 ]]; then
        echo "❌ Error: No se pudo listar el contenido del archivo."
        return 1
    fi
}

# ============================================================
# FUNCIÓN: xgitz
# DESCRIPCIÓN:
#   Respalda y sube a Git archivos personales:
#     - ~/.zshrc
#     - ~/.zxalias
#     - ~/.zxfunction
#
# FUNCIONES:
#   ✔ Copia archivos al directorio actual
#   ✔ Git add
#   ✔ Git commit
#   ✔ Git push
#
# USO:
#   xgitz "mensaje commit"
#
# EJEMPLO:
#   xgitz "Backup configuración shell"
# ============================================================

function xgitz() {


    local COMMIT_MSG="Actualizando perfiles ..."
    local ZSHRC="$HOME/.zshrc"
    local ZXALIAS="$HOME/.zxalias"
    local ZXFUNCTION="$HOME/.zxfunction"

    # Validar existencia de archivos
    for FILE in "$ZSHRC" "$ZXALIAS" "$ZXFUNCTION"; do
        if [[ ! -f "$FILE" ]]; then
            echo "❌ Error: No existe $FILE"
            return 1
        fi
    done

    echo "=================================================="
    echo "COPIANDO ARCHIVOS DE CONFIGURACIÓN..."
    echo "=================================================="

    cp "$ZSHRC" .
    cp "$ZXALIAS" .
    cp "$ZXFUNCTION" .

    echo "=================================================="
    echo "SUBIENDO A GIT..."
    echo "=================================================="
    echo "\nMostrando status ...\n"
    git status \.zxalias \.zxfunction \.zshrc
    xread "siguiente paso...\n"
    echo "\nSubiendo ...\n"
    git add .zshrc .zxalias .zxfunction || return 1
    git commit -m "$COMMIT_MSG" || return 1
    git push || return 1
    echo "\nMostrando status ...\n"
    git status \.zxalias \.zxfunction \.zshrc

    echo "\n=================================================="
    echo "✅ Respaldo completado correctamente."
    echo "==================================================\n"
}








