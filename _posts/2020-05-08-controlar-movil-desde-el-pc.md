---
layout: post
title: Controlar Movil desde el PC
tags: [Movil,Scrcpy,Pc,Gnu,Linux,Android,adb,wifi,usb]
date: 2020-05-08 11:49 -0400
background: ''
---

# Usando el Movil desde el Pc (Gnu/Linux)

En este Post le vamos a echar un vistazo a **Scrcpy**, el cual lo siento por el articulo que me llevo a descubrirlo pero realmente esto fue hace meses y no recuerdo quien fue.

Lo tenia abandonado ya que la idea original era conectar mi movil al portatil por WI-FI por el uso del cargador inalambrico, solo consegui que funcionase por USB y esto no era realente lo que yo queria, así por falta de tiempo me atasque.

Gracias a [@Inaki_Pinto](https://twitter.com/Inaki_Pinto) por un Twiit suyo, que vi por casualidad retome el proyecto y a gracias a sus consejos, hora si que funciona perfectamente.

>Nota: Una vez más gracias la genial comunidad que hay entre usuarios, consigo que un proyecto finalice una vez más.

![](https://pbs.twimg.com/media/EXfEBJ6XYAACI9i?format=jpg&name=medium)

Venga al Turrón que me lío hablando.

---

## ¿Que es Scrcpy?

### scrcpy (v1.13)

Es una Aplicación gratuita y de codigo abierto que proporciona visualización y control de dispositivos Android conectados en USB (o sobre TCP / IP ). No requiere ningún acceso de root . Funciona en GNU / Linux , Windows y macOS .

[![Imagen scrcpy](https://raw.githubusercontent.com/Genymobile/scrcpy/master/assets/screenshot-debian-600.jpg "Imagen scrcpy")](https://raw.githubusercontent.com/Genymobile/scrcpy/master/assets/screenshot-debian-600.jpg "Imagen scrcpy")

La comunicacion entre el servidor (Ordenador) y cliente (Movil) se realizaves de _adb_ . El Movil transmite el vídeo en H.264 al ordenador para decodificarloy mostrarlo, sin guardar nada en el búfer y así tener menos latencia.

> IMPORTANTE: para que funcione Android debe estar en version 5.0 o superior y por supuesto la depuracion _adb_ tiene que estar **Habilitada**

> **NO** es necesario tener rooteado el telefono.

### Características "scrcpy"

- Conexion por USB o WiFi 
- Controlar Android desde el Ordenador, con un ratón y un teclado.
- Hacer Videos del uso del Movil
- Configurar la entrada de video (reolución) del dispositivo
- Cambiar la velocidad de bits del vídeo.
- Controlar el teléfono con atajos de teclado
- Iniciar directamente a pantalla completa
- Vamos a poder instalar Aplicaciones (APK) directamente arrastrando a scrcpy

Para más información ver la pagina del Proyecto en [GitHub](https://github.com/Genymobile/scrcpy)

## Instalación

Como mi experiencia a sido en Gnu/Linux Basado en Debian me voy a centrar en este S.O. per tambien se puede usar en WIndows,MacOS y otras distros Linux (la Instrucciones estan en la Web del proyecto [GitHub](https://github.com/Genymobile/scrcpy))

1.Vale lo primero es satisfacer dependencias:

>Esto lo ejecutaremos en la Shell

><code>sudo apt install ffmpeg libsdl2-2.0-0 adb</code>

><code>sudo apt install gcc git pkg-config meson ninja-build libavcodec-dev libavformat-dev libavutil-dev libsdl2-dev</code>

><code>sudo apt install openjdk-8-jdk</code>

2.Instalaremos el paquete desde los repositorios Oficiales o por Snap 

1. Opcion "Repositorios Oficiales"
	
	<code>sudo apt update</code>

	<code>sudo apt install scrcpy</code>

2. Mediante [snap](https://snapcraft.io/scrcpy)
		(NOTA: Tambien puedes instalarlo desde la [snap-store](https://snapcraft.io/docs/installing-snap-store-app))
	
	<code>sudo snap install scrcpy</code>

3.Solo para los intrepidos (Manualmente)
	
También puedes instalarlo manualmente compilandolo despues de clonarlo del proyecto  (No os preocupeís no es complicado, si os gusta tener control sobre lo que se instala).

- Aqui os dejo las [Instrucciones](https://github.com/Genymobile/scrcpy/blob/master/BUILD.md)


## Como se usa.

> NOTA: En mi caso además de la depuración _adb_ tambien tuve que habilitar la 'depuración USB', pero creo que esto solo es necesario en algunos dispositivos tenedlo en cuenta si os da algún fallo.

#### Para usarlo por **Usb** simplemente.

1. Abre un terminal
2. Conecta tu Movil por **Usb** al ordenador
3. Ejecuta en la terminal <code>scrcpy</code>

> Cuando ejecutes scrcpy por primera vez, asegúrate de que la pantalla del teléfono esté desbloqueada para autorizar la aplicación con el aviso que aparecerá en el teléfono.

![Captura]({{ site.baseurl }}/images/Captura de pantalla de 2020-05-08 15-59-44.png "Captura")

### ¿Cómo ejecutar scrcpy de forma inalámbrica?

1. Conecta el dispositivo al mismo Wi-Fi que tu ordenador
2. Obten la dirección IP de tu movil (en Configuración → Acerca del teléfono → Estado)
3. Habilite _adb_ sobre TCP / IP en su dispositivo: <code>adb tcpip 5555</code>
4. Conéctate a tu dispositivo: <code>adb connect DEVICE-IP: 5555 </code> (reemplaza DEVICE-IP con la IP de tu Movil obetnida en el punto 2)
5. Desenchufa tu movil del **Usb**
6. Ejecute scrcpy en la terminal como en la opción por **Usb** <code>scrcpy</code>

Para volver al modo USB: <code>adb usb</code>

### Extras rapidos.

- Si quieres grabar la pantalla del movil en un fichero en tú ordenador ejecuta:

	<code>scrcpy --record file.mp4</code>

- Poner la aplicación a pantalla competa (Ctrl + F11)

	<code>scrcpy --fullscreen</code>	ó	<code>scrcpy -f </code> #Versión corta.

- Poner la Aplicación siempre encima de las demás
	
	<code>scrcpy --always-on-top</code>

Para más funciones o atajos de teclado visita la pagina del Proyecto de [GitHub](https://github.com/Genymobile/scrcpy)


> Como Nota adicional comentaros que obviamente se puede poner como acceso directo en el escritorio o en el 

#------------

<!--more-->
### AUTORIA Y MERITOS
 
Con la inestimable ayuda de [@Inaki_Pinto](https://twitter.com/Inaki_Pinto)

Autor del Texto Original [@EliasNieva](https://mastodon.social/@eliasNieva)
