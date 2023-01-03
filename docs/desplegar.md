# :tada: Desplegar Jaime

> Se explica como levantar Jaime en varios ambientes

---

## Podman / podman-host

### Requisitos podman

* podman 4.1.1

### Uso podman

Dentro de la carpeta de podman

```sh
make r
```

Para bajarlo

```sh
make k
```

En caso de que tenga algun error

```sh
make c
```

## Podman-compose

### Requisitos podman-compose

* podman 4.1.1
* podman-compose 1.0.3

### Uso podman-compose

Dentro de la carpeta de podman-compose

```sh
podman-compose up
```

Para bajarlo

```sh
podman-compose down
```

## Openshift

### Requisitos Openshift

* Openshift 4

### Uso de template

Previamente se debe estar logueado al cluster con el comando `oc login`

Dentro de la carpeta openshift

```sh
make j
```

### Despliegue con archivo yaml

```sh
oc apply -f https://raw.githubusercontent.com/jaime-project/project-jaime-deploy/master/openshift/jaime.yaml
```

---

## :leftwards_arrow_with_hook: Navegar

* [Volver atras](../README.md)
