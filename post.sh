#!/bin/bash -e
#Titulo         :post.sh
#Descripción   :Scipt para crear Post en el Blog de EliasNieva
#Autor          :Elias Nieva
#Fecha          :2020-04-14
#Versión       :A.0.1
#uso            :./post.sh
#Notas          :
#bash_version   :4.4.20(1)-release
#E-mail         :eliasnieva@keemail.me
#Telegram       :@EliasNieva
#Mastodon       :@EliasNieva@mastodon.social
##===3=====l======N=======1=========P=======r========1======@===3=====l======N=======1=========P=======r========1======@

#============================================================================
#                   TRABAJOS PREVIOS DE COMPROBACION                        #
#============================================================================

# No hay ninguna definida es indepediente.

#============================================================================
#                      DEFINICION DE VARIABLES PROPIAS                      #
#============================================================================

FECHA=`date +%Y-%m-%d`
HORA=`date +%\H:%M`
USERID=`id -g`
IP=`hostname -I  | cut -d " " -f1`
IP2=`hostname -I  | cut -d " " -f2`
VARIABLE_EJEMPLO='valor de ejemplo'

#============================================================================
#                           INICIAMOS EL SCRIPT                             #
#============================================================================

# Aqui iniciamos el Codigo.
# Ejemplo de Mostrar resultados de Variables como Ejemplo.

:<<-! # ESTE CODIGO ESTA COMENTADO PARA MOSTRAR LA SINTAXIS DE COMO DEBEN MOSTRARSE LAS VARIABLES.
echo $FECHA
echo $HORA
echo $USERID
echo $IP
echo $IP2
echo $VARIABLE_EJEMPLO
!
                        

 :<<-! # ESTE CODIGO ESTA COMENTADO PARA MOSTRAR LA VARIABLES HEREDADAS DEL ARCHIVO /home/enieva/scripts/variables.sh

 #-----(↑)----(↑)------(↑)-------- HASTA AQUÍ LAS VARIABLES HEREDADAS ----(↑)------(↑)-----(↑)-------
!
clear
echo -e "----------------------------------------------------------------------------------------------  "
echo -e "                     __ )  |                   |        ____| |_)   __ \        \  |  _ \ "
echo -e "                     __ \  |  _ \   _  |    _  |  _ \   __|   | |  / _  |  __|   \ | |   |"
echo -e "                     |   | | (   | (   |   (   |  __/   |     | | | (   |\__ \ |\  | ___/ "
echo -e "                     ___/ _|\___/ \__, |  \__,_|\___|  _____|_|_|\ \__,_|____/_| \_|_|    "
echo -e "                                  |___/                           \____/                  "
echo -e "                                             Blog de Eli@sNП - 🐧01 "
echo -e "			           BASH where there is a shell, there is a way"
echo "_________https://eliasnp.github.io_________________________________________________eliasnieva@keemail.me____________"

_select_title(){

    # Guardamos el nombre introducido.
    printf "Introduce Nombre: " ; read -r titulo

	# 2020-4-9-nombre del post.md
    title="$FECHA-${titulo}"

    # Quitamos los espacios al nombre si los tiene y los convertimos en "-"
    title=${title// /-}

    # Convertimos las Mayuscalas en Minusculas
    title=${title,,}

    # Le añadimos el .md al final si el archivo ya no lo tiene
    [ "${title: -3}" != '.md' ] && title=${title}.md

    # Revisamos si el nombre dado al archivo ya existe en esta ruta.
    if [ -e $title ] ; then
        printf "\n%s\n%s\n\n" "El script \"$title\" ya existe con ese nombre." \
        "Por favor selecciona Otro nombre de archivo."
        _select_title
    fi

}

_select_editor(){

    # Selecciona entre Nano ó Vim.
    printf "%s\n%s\n%s\n\n" "Seleciona un editor." "1 para Nano." "2 para Vim."
    read -r editor

    # Open the file with the cursor on the twelth line.
    case $editor in
        1) nano +12 _posts/$title
            ;;
        2) vims +12 _posts/$title &
            ;;
        *) /usr/bin/clear
           printf "%s\n%s\n\n" "No he entendido la seleccion." \
               "Presiona <Ctrl-c> para Salir."
           _select_editor
            ;;
    esac

}

_select_title
echo "_________________________________________________________________________________________"
echo "$title"

printf "Intruduce TAGS separadas por comas ej:Shell,ssh,consola,etc >> " ; read -r tags
printf "Dime el Encabezado del Articulo >> " ; read -r ENCABEZADO

:<<-! Texto de ejemplo de inicio de Post
---
layout: post
title: Conexiones y Configuraciones clientes SSH en GNU/linux
tags: [Shell,OpenSSH,ssh,remoto,linux,consola,redes,configuracion]
date: 2020-4-14 13:30:00 -0400
background: ''
---

# ACCIONES SSH #
!
ARCHIVO=_posts/$title

touch $ARCHIVO

echo -e "---" >$ARCHIVO
echo -e "layout: post" >>$ARCHIVO
echo -e "title: $titulo" >>$ARCHIVO
echo -e "tags: [$tags]" >>$ARCHIVO
echo -e "date: $FECHA $HORA -0400" >>$ARCHIVO
echo -e "background: ''" >>$ARCHIVO
echo -e "---" >>$ARCHIVO
echo -e "     " >>$ARCHIVO
echo -e "     " >>$ARCHIVO
echo -e "     " >>$ARCHIVO
echo -e "# $ENCABEZADO" >>$ARCHIVO
echo -e "     " >>$ARCHIVO
echo -e "  -- BORRA ESTO HE INTRODUCE DESDE AQUI EL TEXTO DEL BLOG   " >>$ARCHIVO
echo -e "     " >>$ARCHIVO
echo -e "     " >>$ARCHIVO
echo -e "     " >>$ARCHIVO
echo -e "     " >>$ARCHIVO
echo -e "     " >>$ARCHIVO
echo -e "____" >>$ARCHIVO
echo -e "### AUTORIA Y MERITOS" >>$ARCHIVO
echo -e "     " >>$ARCHIVO
echo -e "Extraido de [-NOMBRE DEL BLOG O WEB-](https://)" >>$ARCHIVO
echo -e "Autor del Texto Original [@EliasNieva](https://mastodon.social/@eliasNieva)" >>$ARCHIVO


_select_editor
