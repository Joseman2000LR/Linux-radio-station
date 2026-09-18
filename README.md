# Estación de Radio SDR en Linux

Script automatizado para configurar una estación completa de radioaficionado y Software Defined Radio (SDR) en sistemas operativos basados en Debian/Ubuntu (Linux).

## 🛠️ Herramientas incluidas

El script instala, compila y configura las siguientes aplicaciones esenciales:

* **SDR++ (SDRPlusPlus):** Un receptor de radio por software multiplataforma, rápido y con soporte para múltiples dispositivos SDR (RTL-SDR, HackRF, Airspy, LimeSDR, etc.).
* **Fldigi:** Software para la operación de modos digitales de radioaficionado (PSK31, RTTY, CW, etc.).
* **Flrig:** Control CAT remoto para transceptores de radio (se integra perfectamente con Fldigi).
* **CHIRP:** Herramienta moderna y gratuita para programar frecuencias y canales en radios portátiles (handies) y bibanda.
* **QLog:** Libro de guardado de contactos (Logbook) moderno para radioaficionados con soporte para ADIF.

---

## 🚀 Guía de Instalación Rápida

Sigue estos sencillos pasos para poner todo en marcha en tu terminal:

### 1. Descargar el script estacion_radio.sh

 estacion_radio.sh
### 2. Dar permisos de ejecución

Otorga permisos para que el sistema pueda ejecutar el script:

chmod +x estacion_radio.sh

### 3. Ejecutar el script

Inicia el proceso de instalación automatizada (te pedirá tu contraseña de administrador/sudo):

./estacion_radio.sh

###  Pasos Finales (SDR++)

Una vez que el script termine reinicie el sistema 
