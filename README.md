# :card_index_dividers: project-jaime-deploy

> despliegue de ejemplo para Jaime

Se utiliza un makefile junto con docker porque docker-compose parece tener un bug con la red que hace que no ande

![alt](img/jaime.png)

## :gear: Requisitos

* docker
* makefile

## :tada: Uso

```bash
# Corre el proyecto, levanta un Jaime con un agente
make r

# Logs de jaime
make lj

# Logs del agente
make la

# Para el proyecto sin eliminar los volumes
make k
```

## :books: Referencias

* [Iconos](https://github.com/ikatyang/emoji-cheat-sheet/blob/master/README.md)

## :grin: Autor

> **Brian Lobo**

* Github: [brianwolf](https://github.com/brianwolf)
* Docker Hub:  [brianwolf94](https://hub.docker.com/u/brianwolf94)
