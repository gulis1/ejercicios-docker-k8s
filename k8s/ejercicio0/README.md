# Ejercicio 0

Para los ejercicios de Kubernetes, vamos a utilizar un cluster virtual
desplegado con [Kind](https://kind.sigs.k8s.io/). Es necesario tener esta
herramienta instalada, además de Docker y kubectl.

Se puede descargar [la máquina virtual](https://drive.google.com/file/d/13bJt7ubaBrUdIPmUj7DPpPQs1LFFNaFb/view?usp=drive_link)
VirtualBox utilizada para las clases del máster, que ya tiene todo el
software necesario instalado.


# Tareas

Lo primero de todo es arrancar el cluster que vamos a utilizar para
los ejercicios. Para ello, hay que ejecutar desde la terminal el script
`arrancar_cluster.sh`, que se encuentra en una carpeta dentro del escritorio
de la máquina virtual (en caso de no utilizar la MV, descrgar los ficheros
de este repositorio).

Al terminar el comando, el cluster sde debería
haber desplegado correctamente. Para comprobarlo, utilizaremos la herramienta
`kubectl`:

    kubectl get nodes

### Pregunta

***¿Cuántos nodos hay en nuestro cluster?***
