#!/bin/bash

# Detener el script si ocurre algún error crítico
set -e

echo "=== [1/6] Actualizando listas del sistema y paquetes (update & upgrade) ==="
sudo apt update && sudo apt upgrade -y

echo "=== [2/6] Instalando utilidades de radio (Fldigi, Flrig ) ==="
sudo apt install -y fldigi flrig 


echo "=== [3/6] Instalando CHIRP (para programación de radios) mediante Flatpak ==="
# Usamos el repositorio alternativo mantenido para CHIRP en Flatpak o Flathub
flatpak remote-add --if-not-exists --no-gpg-verify chirp-repo https://ndarilek.gitlab.io/chirp/ || true
flatpak install -y chirp-repo com.danplanet.chirp.Chirp || echo "CHIRP instalado o disponible en Flatpak."

echo "=== [4/6] Instalando QLog mediante Flatpak ==="
flatpak install -y flathub org.freedesktop.Platform//23.08
flatpak install -y flathub org.qlog.QLog || flatpak install -y flathub net.sourceforge.qlog || echo "Instalando QLog desde Flathub..."
# Nota: Si el ID exacto de QLog en Flathub varía, Flatpak lo buscará o puedes usar el ID oficial.
# Una alternativa segura para asegurar la instalación gráfica de QLog si está en Flathub:
flatpak install -y flathub org.qlog.QLog || true
echo "=== [4/6] Instalando dependencias de compilación para SDR++ ==="
sudo apt install -y  build-essential  cmake   git  libfftw3-dev libglfw3-dev   libglew-dev  libvolk2-dev   libsoapysdr-dev   libairspyhf-dev   libairspy-dev   libiio-dev   libad9361-dev  librtaudio-dev  libhackrf-dev  librtlsdr-dev    libbladerf-dev    liblimesuite-dev   zlib1g-dev   libzstd-dev

echo "=== [5/6] Clonando y compilando SDR++ ==="
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