# :tada: Desplegar Jaime

> Se explica como levantar Jaime en varios ambientes

---

## Local

### podman-compose o docker-compose

#### Requisitos

* podman 4.1.1
  * podman-compose 1.0.3
* docker 23.0.1
  * doker compose (plugin)
  * docker-compose

#### Uso

Dentro de la carpeta de podman-compose

```sh
podman-compose up
```

Para bajarlo

```sh
podman-compose down
```

---

## Cluster

### Openshift

#### Requisitos Openshift

* Openshift 4

#### Despliegue con archivo yaml openshift

Dentro de la carpeta de cluster/openshift

```sh
oc create new-project jaime

oc apply -f jaime.yaml
```

Luego es necesario **cambiar la url del back en el front**, para ello solo hay que cambiar la variable de ambiente del deployment jaime-front llamada JAIME_URL por la generada por el route de jaime-back

### Kubernetes

#### Requisitos Kubernetes

* Kubernetes v1.26.1

#### Despliegue con archivo yaml kubernetes

Dentro de la carpeta de cluster/kubernetes

```sh
kubectl create namespace jaime

kubectl apply -f jaime.yaml
```

Tener en cuenta que los ingress del front y el back apuntan a *jaime-front.minikube* y *jaime-back.minikube*, en caso de quere modificarla hay que modificar los ingress

Luego es necesario **cambiar la url del back en el front**, para ello solo hay que cambiar la variable de ambiente del deployment jaime-front llamada JAIME_URL por la requerida

---

## :leftwards_arrow_with_hook: Navegar

* [Volver atras](../README.md)
