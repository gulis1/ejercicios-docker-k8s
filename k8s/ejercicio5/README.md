# Ejercicio 5

Despligue de MyFilesAPP, utilizando Helm.

## Guía

El primer paso para realiar este ejercicio 
es [instalar Helm](https://helm.sh/docs/intro/install/#from-script):

    curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-4 | bash

Una vez instalado Helm, descargar la carpeta `./chart`, que contiene la chart de Helm
de MyFilesAPP.

Una vez descargada, nos situamos dentro de la carpeta y lanzamos el comando:

```
helm install myfilesapp .
```
