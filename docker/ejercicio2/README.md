# Ejercicio 2

Creación de Dockerfile y despliegue de [AnimalAPP](https://github.com/gulis1/animalAPP).

## Tarea

Escribir un fichero Dockerfile para contenedorizar AnimalAPP. Añadir el contenido necesario
al Dockerfile para cambiar el idioma de la aplicación a español, siguiendo las instrucciones
que se encuentrar en su repositorio.

Esquema del Dockerfile:

1. Partir desde la última versionde Ubuntu.
2. Instalar paquetes `git`, `python3` y `python3-pip`.
3. Clonar el repositorio de la app.
4. Establecer directorio de trabajo dentro del repositorio clonado.
5. Insalar dependencias con pip:

    pip install --break-system-packages -r requirements.txt

6. Copiar ficheros necesarios para cambiar idioma a español (copiar 
`appconf.json` a `/animalAPP`)

7. Indicar que la app estará a la escucha en el puerto 5000 del contenedor.
8. Establecer el comando para que arranque la app.


## Solución

Este es un Dockerfile básico que podría valer:

```Dockerfile
FROM ubuntu:25.10

RUN apt update && \
    apt install -y git python3 python3-pip

RUN git clone https://github.com/gulis1/animalAPP
WORKDIR animalAPP

RUN pip install --break-system-packages -r requirements.txt
# Copiamos fichero de configuración
COPY ./appconf.json /ejercicio3

EXPOSE 5000
ENTRYPOINT ["python3", "app.py"]
```

A continuación, creamos en el mismo directorio que el Dockerfile el fichero
`appconf.json`, con el siguiente contenido:

```
{
    "idioma": "español"
}
```

Una vez tengamos creados ambos ficheros, ejecutamos el siguiente comando en el mismo
directorio en el que se encuentre el Dockerfile:

    docker build . -t animalapp:latest

Finalmente, probar lanzar un contenedor con la imagen creada:

    docker run -p 5000:5000 animalapp:latest

Podemos acceder a la aplicación a través de la dirección `localhost:5000`

Si queremos que la aplicación muestre gatos, hay que establecer la variable de entorno
correspondiente:

    docker run -e ANIMAL=cat -p 5000:5000 animalapp:latest

## Nota

Aunque el Dockerfile desarrollado funciona correctamente y es
perfectamente válido para entornos de desarrollo, la imagen
resultante sería más pesada de lo necesario.

Para entornos de producción, sería convieniente aplicar
[optimizaciones para reducir el tamaño de la imagen](https://docs.docker.com/build-cloud/optimization/).

