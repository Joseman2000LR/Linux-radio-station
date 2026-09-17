#!/bin/bash

# Detener el script si ocurre algún error crítico
set -e

echo "=== [1/5] Actualizando listas del sistema y paquetes (update & upgrade) ==="
sudo apt update && sudo apt upgrade -y

echo "=== [2/5] Verificando e instalando soporte para Flatpak (si no está presente) ==="
if ! command -v flatpak &> /dev/null; then
    echo "Flatpak no está instalado. Procediendo a instalarlo..."
    sudo apt install -y flatpak
else
    echo "Flatpak ya se encuentra instalado en el sistema."
fi

# Asegurar que el repositorio Flathub esté agregado
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

echo "=== [3/5] Instalando utilidades de radio (Flrig y Fldigi) ==="
flatpak install -y flathub com.w1hkj.flrig
flatpak install -y flathub com.w1hkj.fldigi 

echo "=== [4/5] Instalando CHIRP ==="
flatpak install -y flathub com.chirpmyradio.chirp

echo "=== [5/5] Instalando QLog y Gqrx  ==="
flatpak install -y flathub io.github.foldynl.QLog
flatpak install -y flathub dk.gqrx.gqrx

echo ""
echo "=========================================================="
echo "¡Instalación completada con éxito!"
echo "Para completar la configuración, reinicie el sistema."
echo "¡Ahora todo lo que tiene que hacer es disfrutar de sus aplicaciones!"
echo "=========================================================="