#!/usr/bin/env zsh
# ============================================================
#           Configuración Personal de Zsh y Aliases
# ============================================================
# Autor: Carlos Eduardo Ocando Azuaje
# Fecha: 2026-01-24
# Descripción: Aliases, funciones y configuraciones para
#              macOS, Java, Git, Python, Node, npm, Docker,
#              Terraform, Vagrant y utilidades varias.
# ============================================================

# ===============================
# Configuración de JAVA
# ===============================
export PATH='/Applications/IntelliJ IDEA.app/Contents/MacOS':$PATH
export PATH='/Applications/IntelliJ IDEA.app/Contents/MacOS':$PATH
export PATH="/usr/local/bin:/usr/local/shell2/shell2/linux/shell:'/Applications/IntelliJ IDEA.app/Contents/MacOS':$PATH"
export OUTPUT_PATH="./archivo.txt"
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

source ~/.zxfunction
source ~/.zxalias # Limpiar pantalla

#!/usr/bin/env zsh
# ============================================================
# titulo1: Configuración Personal de Zsh con Oh My Posh
# ============================================================

# -------------------------------
# titulo1: Inicialización del PATH
# -------------------------------
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

# -------------------------------
# titulo1: Configuración de Oh My Posh
# -------------------------------
# Instala temas en ~/.poshthemes si no los tienes
mkdir -p ~/.poshthemes
# Descargar un tema por defecto
# if [ ! -f ~/.poshthemes/jandedobbeleer.omp.json ]; then
#     oh-my-posh get "jandedobbeleer.omp.json" --install ~/.poshthemes
# fi

# Inicializar Oh My Posh en Zsh

# -------------------------------
# titulo1: Configuración de prompt básico
# -------------------------------
# Opcional, para un prompt más simple si Oh My Posh falla
export PROMPT='%F{green}%n@%m%f %F{blue}%~%f %# '

# -------------------------------
# titulo1: Configuración de colores
# -------------------------------
autoload -U colors && colors
export LSCOLORS=GxFxCxDxBxegedabagaced # Colores para ls -G

# -------------------------------
# titulo1: Cargar otras configuraciones si existen
# -------------------------------
[ -f ~/.zxaliases ] && source ~/.aliases
[ -f ~/.zxfunctions ] && source ~/.functions

# eval "$(oh-my-posh init zsh --config ~/.poshthemes/jandedobbeleer.omp.json)"
eval "$(oh-my-posh init zsh --config capr4n)"

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

eval "$(/opt/homebrew/bin/brew shellenv)"

#export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
#export JAVA_HOME="/opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home"

export EDITOR="code -w"
export VISUAL="code -w"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
source "$HOME/.sdkman/bin/sdkman-init.sh"
