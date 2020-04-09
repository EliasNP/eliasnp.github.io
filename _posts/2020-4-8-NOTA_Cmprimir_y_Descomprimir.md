---
layout: post
title: NOTAS: Comprimir y Descomprimir .gz, .tar.gz, y .zip por linea de comandos en Linux (Shell)
---

### Archivos .tar.gz:
 + Comprimir: tar -czvf empaquetado.tar.gz /carpeta/a/empaquetar/
 + Descomprimir: tar -xzvf archivo.tar.gz

### Archivos .tar:
 + Empaquetar: tar -cvf paquete.tar /dir/a/comprimir/
 + Desempaquetar: tar -xvf paquete.tar

### Archivos .gz:
 + Comprimir: gzip -9 index.php
 + Descomprimir: gzip -d index.php.gz

### Archivos .zip:
 + Comprimir: zip archivo.zip carpeta
 + Descomprimir: unzip archivo.zip

 Como descomprimir archivos zip, rar, tar.gz, bz2, tar.bz2 por la consola de comandos. Funciona en cualquier versión de Linux.
 ** NOTA: ** Recordar siempre tener los permisos adecuados.

## Para descomprimir ##

### zip: ###
 + unzip nombredelarchivo.zip

### rar ###
 + unrar x nombredelarchivo.rar

### tar ###
 + tar -xvf nombredelarchivo.tar

### tar.gz ###
 + tar -vzxf nombredelarchivo.tar.gz

### bz2 ###
 + bunzip nombredelarchivo.bz2

### tar.bz2 ###
 + tar -jxvf nombredelarchivo.tar.bz2
