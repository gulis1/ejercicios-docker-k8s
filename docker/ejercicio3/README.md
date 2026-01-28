# Ejercicio 3

Uso de volúmenes y bind mounts.

## Tarea

Vamos a usar la imagen `filebrowser/filebrowser`, que permite crear
y almacenar documentos.

Vamos a crear documentos dentro de `filebrowser`, y observar
qué pasa cuando borramos y arrancamos de nuevo el contenedor:

1. Sin volúmenes ni bind mounts.
2. Utilizando un bind mount.
3. Utilizando volúmen (nombre "my_files").

Para arrancar la aplicación, utilizamos el siguiente comando 
(al utilizar la opción `--rm`, cuando detengamos el contenedor
usando CTRL+C, este se borrará automáticamente):
    
    docker run --rm -p 8080:80 filebrowser/filebrowser
    
Y accedemos con el navegador desde `localhost:8080`. El usuario para acceder a la aplicación
es `admin`, y la contraseña generada automáticamente se puede obtener observando
la salida del comando anterior.

## Solución

Si creamos un fichero sin utilizar ningún tipo de almacenamiento
persistene, al borrar y volver a arrancar el contenedor, el fichero
que hemos creado se pierde.

Para utilizar un bind mount, primero creamos la carpeta `files` (comando `mkdir files`).
A continuación, utilizamos  el siguiente comando para que los ficheros creados 
se guarden en esta carpeta.

    docker run -v ./files:/srv --rm -p 8080:80 filebrowser/filebrowser

Como los ficheros se guardan en esta carpeta, al volver a arrancar el contenedor
no hemos perdido nada.

Por último si usamos un volúmen con nombre, tampoco perdemos los ficheros que creamos.
Sin embargo, en este caso no podemos ver los ficheros creados en ninguna carpeta de nuestro
equipo, sino que Docker los guarda internamente en un volumen, bajo el nombre `my_files`. 

    docker run -v my_files:/srv --rm -p 8080:80 filebrowser/filebrowser
