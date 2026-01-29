# Ejercicio 4

En este ejercicio se va a desplegar la aplicación 
[myfilesapp](https://github.com/gulis1/myfilesapp) sobre nuestro
cluster. Esta aplicación se describe con más detalle
en el ejercicio4 de docker.

Para ello, vamos a tener que crear:

- **Tres deployments:** para la aplicación web, base de datos y
servidor NGINX.
- **Tres servicios**, uno para cada deployment.
- **Dos PVC:** uno para la base de datos, y otro para los ficheros
que suban los usuarios.
- **Un ConfigMap:**, para crear y inicializar las tablas de la
base de datos.

En total, usaremos nueve ficheros YAML para describir
la aplicación. Al tener que desplegarse tantas cosas, **se
recomienda utilizar un namespace propio para la aplicación**,
bajo el que se desplegaran todos los ficheros.

## Tareas

Descargarse y rellenar las nueve plantillas que definen la
aplicación. Para una mejor organización, las plantillas se
encuentran divididas en tres carpetas distintas.

Las plantillas se encuentran dentro de
la carpeta `./plantillas` de este repositorio.

Tras rellenar las plantillas, utilizar el comando `kubect apply`
para aplicar todos los ficheros.

## Soluciones

Los ficheros YAML completos se encuentran dentro de
la carpeta `./soluciones` de este repositorio.
