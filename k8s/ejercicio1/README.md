# Ejercicio 1

Despliegue de pod NGINX sobre el cluster.

## Tareas

Escribir fichero YAML para crear un Pod que despliegue un servidor NGINX
sobre el cluster. Para ello, deberá crearse un fichero `nginx.yaml` en
cualquier directorio de nuestro equipo, y copiarse el contenido de la
siguiente plantilla:

```yaml
apiVersion: v1
kind: ???
metadata:
  name: nginx-pod
spec:
  containers:
  - name: nginx
    image: ???
    ports:
    - containerPort: 80
```

Una vez rellenada la plantilla del fichero, puede aplicarse utilizando
el comando:

    kubectl apply -f ./nginx.yaml

Para acceder al servidor NGINX desde nuestro navegador, ejecutar el
siguiente comando:

    kubectl port-forward pod/nginx-pod 30800:80

y acceder desde el navegador a la dirección ```localhost:30800```

## Solución

Contenido del fichero `nginx.yaml`:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx-pod
spec:
  containers:
  - name: nginx
    image: nginx:latest
    ports:
      - containerPort: 80
```
