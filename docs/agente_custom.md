# Creacion de agentes custom

> Se explica como crear agentes custom con **docker o postman**

---

## Agente simple

Es necesario definir lo siguiente para que funcione

```dockerfile
FROM ghcr.io/jaime-project/jaime-agent:1.12.0
ENV AGENT_TYPE=TU_TIPO_DE_AGENTE
```

La imagen se basa en **python:3.9-slim**

### Ejemplo de agente custom para OPENSHIFT

```dockerfile
FROM ghcr.io/jaime-project/jaime-agent:1.12.0
ENV AGENT_TYPE=OPENSHIFT

COPY resources/oc.tar.gz . 
RUN tar -xf oc.tar.gz 
RUN rm oc.tar.gz

RUN chmod 755 oc
ENV PATH="$HOME:$PATH"
```

## Agente con un ejecutable en background

Se utiliza la siguiente variable para correr un comando ademas del agente

```dockerfile
FROM ghcr.io/jaime-project/jaime-agent:1.12.0
ENV AGENT_TYPE=TU_TIPO_DE_AGENTE
ENV EXTRA_CMD="tu comando a ejecutar"
```

La ejecucion se hace de la siguiente manera

```dockerfile
CMD ${EXTRA_CMD} & python3 -m gunicorn -b ${PYTHON_HOST}:${PYTHON_PORT} --workers=1 --threads=4 app:app
```

### Ejemplo de agente custom para servidor de pushgateway

```dockerfile
FROM ghcr.io/jaime-project/jaime-agent:1.12.0
ENV AGENT_TYPE=PUSHGATEWAY
ENV EXTRA_CMD="pushgateway"

RUN wget https://github.com/prometheus/pushgateway/releases/download/v1.2.0/pushgateway-1.2.0.linux-amd64.tar.gz
RUN tar xvfz pushgateway-1.2.0.linux-amd64.tar.gz
RUN rm -fr pushgateway-1.2.0.linux-amd64.tar.gz

RUN chmod 755 pushgateway-1.2.0.linux-amd64 -R
ENV PATH="$HOME/pushgateway-1.2.0.linux-amd64:$PATH"

EXPOSE 9091
```

---

## :leftwards_arrow_with_hook: Navegar

* [Volver atras](../README.md)
