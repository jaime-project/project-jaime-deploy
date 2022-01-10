# :card_index_dividers: project-jaime-deploy

> despliegue de ejemplo para Jaime

Se utiliza un makefile junto con docker porque docker-compose parece tener un bug con la red que hace que no ande

![alt](img/logo.png)

## :gear: Requisitos

* docker
* makefile

## :tada: Uso

```bash
# Corre el proyecto, levanta un Jaime con un agente
make r

# Para el proyecto sin eliminar los volumes
make k
```

Para los logs ingresar al [dozzle](http://localhost:8080) local

Para el filesystem ingresar al [filebrowser](http://localhost:9090) local

## :books: Referencias

* [Iconos](https://github.com/ikatyang/emoji-cheat-sheet/blob/master/README.md)

## :grin: Autor

> **Brian Lobo**

* Github: [brianwolf](https://github.com/brianwolf)
* Docker Hub:  [brianwolf94](https://hub.docker.com/u/brianwolf94)
