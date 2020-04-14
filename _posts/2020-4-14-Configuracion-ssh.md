---
layout: post
title: Conexiones y Configuraciones clientes SSH en GNU/linux
tags: [Shell,OpenSSH,ssh,remoto,linux,consola,redes,configuracion]
date: 2020-4-14 13:30:00 -0400
background: ''
---

# ACCIONES SSH #

## CONEXIÓN SSH ##

#### CREAR CONEXIÓN

Para explicar el funcionamiento de las conexiones por **SSH** vamos a usar como ejemplo 
un servidor local ` Local@host` y un servidor remoto al que llamaremos `maquina_remota`y un usuario al que llamaremos `user`  para el conexion podriamos usar una IP o un dominio  para nuestra `maquina_remota` así que le vamos a asignar unos valores para el ejemplo.

Para la **IP** le pondremos `5.175.5.175` y para el **dominio**  le pondremos `hostremoto.com`, estos ejemplos entendiendo que estén fuera de nuetra red y este todo configurado para poder acceder externamente, aunque también podrian ser equipos de nuestra propia reda los que solo habria que indicarles los datos internos como ejemplo la ip interna podria ser `192.168.1.100`, el puerto *22* es el que se establece por **defecto** en la configuración pero a mí por seguridad me gusta cambiarlo os lo recomiendo, así que usaremos como **puerto** el `2222`

>No obstate RECUERDA que si copias y pegas los comandos en tu maquina deberas sustituir los valores de ejemplo con los tuyos propios.

------------

		Local@host~$> ssh usuario@host -p puerto

+  **ssh**: es el comando.
+ **usuario**: es el Nombre del usuario remoto.
+ **@host**: es la dirección del servidor remoto donde nos vamos a conectar.
+ **-p**: es la variable del comando **ssh** que nos permite introducir un puerto diferente del "22" por defecto.
+ **puerto**:es el numero del puerto al que vamos a conectarnos.

Despúes de esta explicación una situación real según nuestro ejemplo seria.
>Local@host:~$> ssh user@5.175.5.175 -p 2222

*Respuesta del Servidor remoto pidiendo password.*
>user@5.175.5.175`s password:

*Si lo hemos introducido bien nos saldra el prompt del Servidor remoto*
>Last login: Fri Apr 10 12:16:02 2020 from localhost
user@maquina_remota:~$ >


### ELIMINAR CONEXIÓN (''Key'') YA CREADA 

>Local@host:~$>ssh-keygen -R hostname			(EJ: ;$>ssh-keygen -R 192.168.1.200 )

### CRAR CLAVE RSA PRIVADA DE SSH ##
>Local@host~$>user@maquina_local$ ssh-keygen -b 4096

>	Generating public/private rsa key pair.
	Enter file in which to save the key (/home/user/.ssh/id_rsa):
	Enter passphrase (empty for no passphrase):
	Enter same passphrase again:
	Your identification has been saved in /home/user/.ssh/id_rsa.
	Your public key has been saved in /home/user/.ssh/id_rsa.pub.

###	COPIAMOS LA CLAVE PUBLICA AL SERVIDOR
>user@maquina_local$ scp ~/.ssh/id_rsa.pub user@maquina_remota:/home/user/uploaded_key.pub 	\(Tambien puede ir a /root/...\)

La clave pública hay que incluirla en el archivo /home/user/.ssh/authorized_keys. Si la carpeta .ssh no existe, la creamos antes de copiar, así como el **archivo authorized_keys:**
	
>	user@maquina_remota$ cd /home/user/
	user@maquina_remota$ mkdir .ssh
	user@maquina_remota$ chmod 700 .ssh
	user@maquina_remota$ touch .ssh/authorized_keys
	user@maquina_remota$ chmod 600 .ssh/authorized_keys

Por último copiamos la clave y borramos el archivo copiado al servidor:
	
>user@maquina_remota$ echo `cat ~/uploaded_key.pub` >> ~/.ssh/authorized_keys
>user@maquina_remota$ rm /home/user/uploaded_key.pub

___

### AUTORIA Y MERITOS

Extraido de [Geekland](https://is.gd/ZsbQmy)
Autor del Texto Original [Joan Carles](https://twitter.com/jccall80)
___

