# 📻 Estación de Radio SDR en Linux

Script automatizado para desplegar una **estación completa de radioaficionado y Software Defined Radio (SDR)** en sistemas operativos basados en Debian/Ubuntu (Linux) de forma rápida y limpia mediante Flatpak.

---

## 🛠️ Herramientas Incluidas

El script instala y configura las siguientes aplicaciones esenciales para la radioafición moderna:

* **Gqrx:** Receptor de radio por software rápido y versátil, con soporte para múltiples dispositivos SDR (RTL-SDR, HackRF, Airspy, LimeSDR, etc.).
* **Fldigi:** Estándar para la operación de modos digitales de radioaficionado (PSK31, RTTY, CW, Olivia, entre otros).
* **Flrig:** Control CAT remoto para transceptores de radio, integrado perfectamente con Fldigi.
* **CHIRP:** Herramienta moderna para programar frecuencias, memorias y canales en radios portátiles (handies) y bibanda.
* **QLog:** Libro de guardia (*Logbook*) moderno para radioaficionados con soporte completo para exportación/importación ADIF.

---

## 🚀 Guía de Instalación Rápida

Sigue estos sencillos pasos en tu terminal para poner todo en marcha:

### 1. Crear y guardar el script

Descargar El archivo llamado `estacion_radio.sh` en tu equipo y pega el contenido del script de instalación.

### 2. Dar permisos de ejecución

Otorga permisos para que tu sistema pueda ejecutar el script:

```bash
chmod +x estacion_radio.sh
```

### 3. Ejecutar el script

Inicia el proceso de instalación automatizada (te pedirá tu contraseña de administrador/sudo):

```Bash
./estacion_radio.sh
```

### Paso Final
Una vez que el script finalice con éxito:

Reinicia tu sistema para asegurar que los permisos de los dispositivos USB (como dongles SDR o cables CAT) y los entornos de Flatpak se carguen correctamente.

¡Abre tus aplicaciones desde el menú de tu escritorio y disfruta de la radioafición 73!
