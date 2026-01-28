# Ejercicio 1

Despliegue de NextCloud con Docker.

## Tarea

Usar el comando `docker run` para desplegar NextCloud.Las instrucciones para desplegar 
esta imagen se pueden encontrar en [su página de Docker Hub.](https://hub.docker.com/_/nextcloud).

## Solución

Utilizar el siguiente comando:

    docker run -p 8080:80 nextcloud

Después, podemos acceder desde nuestro navegador a través de la dirección:

    localhost:8080
