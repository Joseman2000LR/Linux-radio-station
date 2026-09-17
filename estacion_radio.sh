#!/bin/bash

# Detener el script si ocurre algún error crítico
set -e

echo "=== [1/5] Actualizando listas del sistema y paquetes (update & upgrade) ==="
sudo apt update && sudo apt upgrade -y

echo "=== [2/5] Instalando utilidades de radio (Fldigi, Flrig y QLog) ==="
sudo apt install -y fldigi flrig qlog

echo "=== [3/5] Instalando CHIRP (para programación de radios) ==="
# Intentamos instalar chirp por apt; si no está disponible, usamos pipx
if sudo apt-cache policy chirp | grep -q "Candidate:"; then
    sudo apt install -y chirp
else
    echo "CHIRP no está en los repositorios de APT. Instalando vía pipx..."
    sudo apt install -y python3-pip pipx
    pipx install chirp-radio
    pipx ensurepath
fi

echo "=== [4/5] Instalando dependencias de compilación para SDR++ ==="
sudo apt install -y \
    build-essential \
    cmake \
    git \
    libfftw3-dev \
    libglfw3-dev \
    libglew-dev \
    libvolk2-dev \
    libsoapysdr-dev \
    libairspyhf-dev \
    libairspy-dev \
    libiio-dev \
    libad9361-dev \
    librtaudio-dev \
    libhackrf-dev \
    librtlsdr-dev \
    libbladerf-dev \
    liblimesuite-dev \
    zlib1g-dev \
    libzstd-dev

echo "=== [5/5] Clonando y compilando SDR++ ==="
if [ -d "SDRPlusPlus" ]; then
    echo "El directorio SDRPlusPlus ya existe. Actualizando cambios..."
    cd SDRPlusPlus
    git pull
else
    git clone https://github.com/AlexandreRouma/SDRPlusPlus.git
    cd SDRPlusPlus
fi

mkdir -p build
cd build
cmake ..
make -j$(nproc)

echo ""
echo "=========================================================="
echo "¡Instalación y compilación de la estación completadas!"
echo "=========================================================="
echo "-> Fldigi, Flrig, QLog y CHIRP están listos en tu menú de aplicaciones."
echo "-> Para instalar SDR++ de forma permanente en el sistema, ejecuta:"
echo "     cd SDRPlusPlus/build && sudo make install"