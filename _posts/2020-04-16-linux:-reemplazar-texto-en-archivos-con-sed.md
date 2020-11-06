---
layout: post
title: Linux Reemplazar texto en archivos con sed
tags: [sed,linux,comandos,archivos,buscar,find,texto]
date: 2020-04-16 09:38 -0400
background: ''
---
     
     
     
# Linux Sed
     

[ORIGEN](sysadmit.com)
Linux: Reemplazar texto en archivos con sed

Si queremos buscar y reemplazar texto en entornos Linux, disponemos de varias herramientas para ello.

Una de ellas es con el comando sed.

Linux SED: Reemplazar texto en archivos con sed

El comando sed está presente en la mayoría de distribuciones de Linux y está pensado para manipular cadenas de texto.

Si no disponemos del comando sed lo podemos instalar de la siguiente forma:

    Para CentOS/RHEL: yum install sed
    Para Debian/Ubuntu: apt-get install sed

Sintaxis general y tres ejemplos para reemplazar texto en archivos:

Sintaxis general:

>sed -i 's/texto-a-buscar/texto-a-reemplazar/g' "Fichero o directorio"

+Ejemplo 1: Cambiamos el texto Sysadmit por SYSADMIT del interior del fichero: test.txt

>\[root@LINUX1 test]# cat test.txt
Sysadmit1
1Sysadmit
90Sysadmit82
HSysadmitH21
 

[root@LINUX1 test]# sed -i 's/Sysadmit/SYSADMIT/g' "test.txt"
 

[root@LINUX1 test]# cat test.txt
SYSADMIT1
1SYSADMIT
90SYSADMIT82
HSYSADMITH21


Ejemplo 2: Cambiamos el texto SYSADMIT por --SYSADMIT-- en todos los ficheros *.txt a partir de la ruta /test/ de forma recursiva.

Para ello utilizaremos los siguientes comandos:

find: Nos realizará una búsqueda de todos los ficheros según el patrón definido.

xargs: Ejecutará un comando (en este caso sed) para cada resultado generado por el comando find.
| : Pipe o tubería, en este caso la salida de find corresponderá a la entrada de sed.

sed: Realizará el "buscar-reemplazar".

[root@LINUX1 test]# pwd
/test

[root@LINUX1 test]# du -ah
4.0K    ./new/test.txt
8.0K    ./new
4.0K    ./test.txt
16K     .

[root@LINUX1 test]# cat ./new/test.txt
SYSADMIT1
1SYSADMIT
90SYSADMIT82
HSYSADMITH21

[root@LINUX1 test]# cat ./test.txt
SYSADMIT1
1SYSADMIT
90SYSADMIT82
HSYSADMITH21

[root@LINUX1 test]# find /test/ -name "*.txt" -print | xargs sed -i "s/SYSADMIT/--SYSADMIT--/g"

[root@LINUX1 test]# cat ./new/test.txt
--SYSADMIT--1
1--SYSADMIT--
90--SYSADMIT--82
H--SYSADMIT--H21

[root@LINUX1 test]# cat ./test.txt
--SYSADMIT--1
1--SYSADMIT--
90--SYSADMIT--82
H--SYSADMIT--H21

Ejemplo 3: Cambiamos una URL por otra del interior de un fichero de texto (test.txt).

El problema de las URLs es que contienen el carácter: "/".

El carácter "/", sed lo utiliza para definir el texto original y el texto a reemplazar.

En el siguiente ejemplo, reemplazaremos la URL:

http://sysadmit.com

por:

http://www.sysadmit.com/p/faq-libros.html

dentro del fichero: test.txt

Para ello, utilizaremos el caracter: "%"

[root@LINUX1 test]# cat test.txt
http://sysadmit.com

[root@LINUX1 test]# sed -i "s%http://sysadmit.com%http://www.sysadmit.com/p/faq-libros.html%g" "test.txt"


[root@LINUX1 test]# cat test.txt
http://www.sysadmit.com/p/faq-libros.html
 

     
     
     
     
     
____
### AUTORIA Y MERITOS
     
Extraido de [-NOMBRE DEL BLOG O WEB-](https://)
Autor del Texto Original [@EliasNieva](https://mastodon.social/@eliasNieva)
