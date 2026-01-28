
# Ejercicio 4

Uso de la herramienta Docker Compose.

## Tareas

En este ejercicio vamos a desplegar la aplicación multicontenedor 
[myfilesapp](https://github.com/gulis1/myfilesapp) utilizando
Docker Compose.

Esta aplicación permite a los usuarios entrar con su cuenta para
subir y descargar ficheros. Vamos a necesirtar tres contenedores:

- **Aplicación Flask.** Los usuarios podrán subir ficheros, que se guardarán en un bind-mount.
- **Servidor NGINX.** Compartirá el mismo bind-mount que la aplicación flash para servir ficheros de los usuarios.
- **Base de datos Postgres,** para guardar usuarios y contraseñas.

Lo primero que hay que hacer es clonar el repositorio de la app.
Nos encontraremos con directorios:

- **./db**:  contiene un fichero SQL para inicializar la base de datos.
- **./webapp**:  contiene la aplicación web Flask.

### Primera tarea

Primero hay que construir el fichero Dockerfile para la aplicación Flask.
Para ello, crear un fichero llamado `Dockerfile` **dentro del directorio
`./webapp`.

Esta vez, se recomienda partir de la imagen `python:3.11-slim`. Esta imagen
trae un sistema Debian muy ligero con Python presintalado, por lo que no 
será necesario que lo instalemos en el Dockerfile.

Cosas a tener en cuenta al escribir del Dockerfile:

- Hay que instalar las dependencias de Python, con el mismo comando que
se uso en el ejercicio 2.
- Tenemos que crear el directorio `/files` dentro de la imagen.
- Para arrancar el contenedor, hay que ejecutar el fichero `app.py`.
- La aplicación está a la escucha de peticiones en el puerto 500.

Antes de pasar a la segunda tarea, se recomienda comprobar que la imagen
se construye correctamente. Para ello, hay que usar el comando `docker build .`
dentro del directorio `./webapp`.

### Segunda tarea

Una vez hemos creado el Dockerfile, el siguiente paso es escribir el fichero
`docker-compose.yml`, donde se describirán los tres contenedores necesarios
para la aplicación. Este fichero se tiene que crear **en el directorio raíz
del repositorio.**

En el fichero se deberán definir tres contenedores:

**Contenedor web:**
- Construir la imagen a partir del Dockerfile creado.
- Puerto `5000:5000`
- Los ficheros que suba el usuario se guardarán en un bind-mount:
`./user_files:/files`
- Variables de entorno:
    - `DB_HOST=<nombre contenedor de la BD>`

**Contenedor Postgres:**

- Utilizar [imagen oficial de Postgres](https://hub.docker.com/_/postgres)
- Necesarios:
    - Volúmen para guardar los datos de la BD:
    `<nombre>:/var/lib/postgresql`
    - Bind mount para iniciar BD:
    `./db/init.sql:/docker-entrypoint-initdb.d/init.sql`
- Buscar variables de entorno necesarias para configurar nombre, usuario
y contraseña de la BD.

**Contenedor NGIN:X**
- Utilizar [imagen oficial de NGINX](https://hub.docker.com/_/nginx).
- Puerto `30080:80`
- Bind mount para servir contenido del directorio `user_files`:
`user_files:/???` (consultar ruta de montado el la pagina de Docker Hub).

Como ayuda, se puede descargar una plantilla para este ejercicio.
```yaml
services:
  web:
    # Directorio para construir imagen
    build: ???
    ports:
      - "???"
    environment:
      DB_HOST: db
    volumes:
      - ???
    depends_on:
      - db

  db:
    image: ???
    environment:
      # Nombre BD
      ???: appdb
      # Usuario BD
      ???: appuser
      # Contraseña BD
      ???: apppass
    volumes:
      - ???
      - ???

  nginx:
    image: ???
    ports:
      - "???"
    volumes:
      - ???
    depends_on:
      - web

volumes:
  ???:
```

Para arrancar la aplicación, utilizarel siguiente comando en el
directorio en el que se encuentre el fichero:

    docker compose up

Para entrar a la aplicación, podemos usar el usuario `bob` y
contraseña `123`.

## Solución


### Tarea 1
Posible fichero Dockerfile:

```Dockerfile
FROM python:3.11-slim

WORKDIR /app

COPY . .

RUN pip install --no-cache-dir -r requirements.txt

RUN mkdir /files

EXPOSE 5000

CMD ["python", "app.py"]

```

### Tarea 2

Fichero `docker-compose.yml`:

```yml
services:
  web:
    build: ./webapp
    ports:
      - "5000:5000"
    environment:
      DB_HOST: db
    volumes:
      - ./user_files:/files
    depends_on:
      - db

  db:
    image: postgres:latest
    environment:
      POSTGRES_DB: appdb
      POSTGRES_USER: appuser
      POSTGRES_PASSWORD: apppass
    volumes:
      - db_data:/var/lib/postgresql
      - ./db/init.sql:/docker-entrypoint-initdb.d/init.sql

  nginx:
    image: nginx:latest
    ports:
      - "30080:80"
    volumes:
      - ./user_files:/usr/share/nginx/html:ro
    depends_on:
      - web

volumes:
  db_data:
```
