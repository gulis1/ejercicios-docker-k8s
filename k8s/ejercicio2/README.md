# Ejercicio 2

Creación de un Deployment y un Service.

## Tareas

Antes de empezar este ejercicio, **borrar el pod del ejercicio 1** con:

    kubectl delete -f ./nginx.yaml

En este ejercicio vamos a desplegar la aplicación [AnimalAPP](https://github.com/gulis1/animalAPP/tree/master)
sobre nuestro cluster.

Para ello, vamos a crear un fichero YAML en el que definiremos:

- Un Deployment, en el que estableceremos **3 réplicas** de nuestra
aplicación. La imágen que hay que utilizar es: `gulis1/animalapp:2.0`
- Un servicio NodePort, para acceder a la aplicación.

Se ofrece la siguiente plantilla, que deberá pegarse en un fichero
`animalapp.yaml`:

```yaml
apiVersion: apps/v1
kind: ???
metadata:
  name: animalapp-deployment
spec:
  replicas: ???
  selector:
    matchLabels:
      app: ???
  template:
    metadata:
      labels:
        app: ???
    spec:
      containers:
      - name: ???
        image: ???
        ports:
        - containerPort: ???
---
apiVersion: v1
kind: Service
metadata:
  name: animalapp-service
spec:
  selector:
    app: ???
  type: NodePort
  ports:
    - protocol: TCP
      port: 5000
      targetPort: 5000
      nodePort: 30800
```

Al terminar de rellenar la plantilla, deberemos aplicar el fichero:

    kubectl apply -f ./animalapp.yaml

Podemos utilizar el siguiente comando para observar cuantos pods se 
han creado, y en qué nodo está corriendo cada uno:

    kubect get pods -o wide



Para acceder a la aplicación, crear de nuevo un túnel:
    
    kubectl port-forward service/animalapp-service 5000:5000

y acceder desde la dirección `localhost:5000`

## Solución

Fichero `animalapp.yaml`:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: animalapp-deployment
spec:
  replicas: 3
  selector:
    matchLabels:
      app: animalapp
  template:
    metadata:
      labels:
        app: animalapp
    spec:
      containers:
      - name: animalapp
        image: gulis1/animalapp:2.0
        ports:
        - containerPort: 5000
---
apiVersion: v1
kind: Service
metadata:
  name: animalapp-service
spec:
  selector:
    app: animalapp
  type: NodePort
  ports:
    - protocol: TCP
      port: 5000
      targetPort: 5000
      nodePort: 30800
```
