---
layout: post
title: PhpMyAdmin :Warning in ./libraries/sql.lib.php#601
tags: [Shell,Comandos,PHP,Error,MySqlySql,Phpmyadmin,Linux,Codigo,Database,BBDD]
date: 2020-4-14 12:30:00 -0400
background: ''
---

## Solucionar Error phpMyAdmin. count(): Parameter must be an array 

	- [Origen](https://is.gd/THKfsc)

La última vez que he instalado un servidor web en Ubuntu 18.04, me ha salido un mensaje de error en phpMyAdmin, concretamente el error: Warning in ./libraries/sql.lib.php#601
count(): Parameter must be an array or an object that implements Countable.

Todos sabemos que es algo molesto ver esos errores, o más bien warning que aparecen en nuestro panel de phpMyAdmin. Genera incomodidad tener que pulsar una y otra ves en el botón de ignorar aviso.

Para corregir el error count(): Parameter must be an array or an object that implements Countable

Vamos a ver cómo corregir este error, o más bien warning, porque en principio, yo he estado usando normalmente phpMyAdmin, con la incomodidad de tener que pulsar en ignorar cada vez que me mostraba este aviso. Para corregir el error vamos a editar el archivo :

	/usr/share/phpmyadmin/libraries/sql.lib.php

Aquí buscamos la línea:

	(count($analyzed_sql_results['select_expr'] == 1)

Y lo vamos a reemplazar por:

	(count($analyzed_sql_results['select_expr']) == 1

Ahora, recargamos web de phpMyAdmin y ya no debe mostrar más el error.
 ___

 ## AUTORIA Y MERITOS
 + Este articulo esta copiado integramente de [Carlos Hernandez](https://medium.com/@carlosferrerhernandez?source=follow_footer--------------------------follow_footer-)
  * Aqui pueden leer el Documento [Original](https://is.gd/THKfsc)
