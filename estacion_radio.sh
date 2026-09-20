#!/bin/bash

# Detener el script si ocurre algún error crítico
set -e

echo "=== [1/5] Actualizando listas del sistema y paquetes (update & upgrade) ==="
sudo apt update && sudo apt upgrade -y

echo "=== [2/5] Verificando e instalando soporte para Flatpak ==="
if ! command -v flatpak &> /dev/null; then
    echo "Flatpak no está instalado. Procediendo a instalarlo..."
    sudo apt install -y flatpak
else
    echo "Flatpak ya se encuentra instalado en el sistema."
fi

# Asegurar que el repositorio Flathub esté agregado
flatpak remote-add --if-not-exists flathub [https://dl.flathub.org/repo/flathub.flatpakrepo](https://dl.flathub.org/repo/flathub.flatpakrepo)

echo "=== [3/5] Instalando aplicaciones de Radioafición y SDR vía Flatpak ==="

if ! flatpak info com.w1hkj.flrig &> /dev/null; then
    echo "Instalando Flrig..."
    flatpak install -y flathub com.w1hkj.flrig
else
    echo "Flrig ya se encuentra instalado."
fi

if ! flatpak info com.w1hkj.fldigi &> /dev/null; then
    echo "Instalando Fldigi..."
    flatpak install -y flathub com.w1hkj.fldigi
else
    echo "Fldigi ya se encuentra instalado."
fi

echo "=== [4/5] Instalando CHIRP y QLog ==="
if ! flatpak info com.chirpmyradio.chirp &> /dev/null; then
    echo "Instalando CHIRP..."
    flatpak install -y flathub com.chirpmyradio.chirp
else
    echo "CHIRP ya se encuentra instalado."
fi

if ! flatpak info io.github.foldynl.QLog &> /dev/null; then
    echo "Instalando QLog..."
    flatpak install -y flathub io.github.foldynl.QLog
else
    echo "QLog ya se encuentra instalado."
fi

echo "=== [5/5] Instalando Gqrx ==="
if ! flatpak info dk.gqrx.gqrx &> /dev/null; then
    echo "Instalando Gqrx..."
    flatpak install -y flathub dk.gqrx.gqrx
else
    echo "Gqrx ya se encuentra instalado."
fi

echo ""
echo "=========================================================="
echo " ¡Instalación completada con éxito!"
echo " Para completar la configuración, reinicie el sistema."
echo " ¡Ahora todo lo que tiene que hacer es disfrutar 73!"
echo "=========================================================="