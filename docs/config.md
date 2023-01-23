# Configurar Jaime

> Registro de configuraciones para tu Jaime

---

## jaime-front

### Apuntar el front al back

Es necesario actualizar el valor de una variable para apuntar al back

```yaml
JAIME_URL: http://tu_jaime_backend/
```
---

## jaime-back

### Base de datos externa

Se puede usar una **base de datos externa** agregando una variable de ambiente

```yaml
# mysql
DB_URL: mysql+pymysql://user:pass@host:port/database

# postgresql
DB_URL: postgresql+pg8000://user:pass@host:port/database

# sqlserver
DB_URL: mssql+pymssql://user:pass@host:port/database
```

---


## :leftwards_arrow_with_hook: Navegar

* [Volver atras](../README.md)
