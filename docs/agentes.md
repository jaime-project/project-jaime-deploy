# Herramientas de los agentes

Explica el uso de la libreria de **tools** para la creacion de modulos

---

## Uso de las tools

Para usar las tools solo hay que hacer un import en tu modulo

```python
import tools

resultado = tools.sh('echo "hola mundo redondo"')
```

## Funciones de las tools

| Funcion           | Entrada                                                                                       | Salida                | Descripcion                                               |
| ---               | ---                                                                                           | ---                   | ---                                                       |
| sh                | **cmd**: str, **echo**: bool = true                                                           | str                   | Ejecuta un comando en bash y devuelve el resultado        |
| ssh               | **server_name**: str, **cmd**: str, **echo**: bool = True                                     | str                   | Ejecuta un comando por ssh y devuelve el resultado        |
| get_clusters_name | -                                                                                             | List[str]             | Devuelve la lista de los cluster agregados en Jaime       |
| get_servers_name  | -                                                                                             | List[str]             | Devuelve la lista de los servers agregados en Jaime       |
| get_params        | -                                                                                             | Dict[str, object]     | Devuelve los parametros cargados al work en el yaml       |
| login_openshift   | **cluster_name**: str                                                                         | bool                  | Logea en openshift y devuelve true si se pudo loguear     |
| login_kubernetes  | **cluster_name**: str                                                                         | bool                  | Logea en kubernetes y devuelve true si se pudo loguear    |
| new_jaime_job     | **repo_name**: str, **module_name**: str, **agent_type**: str, **params**: Dict[str, object] = {}, **name**: str = uuid4() | str                   | Ejecuta una tarea en Jaime, devuelve el id del work creado |
| new_message       | **title**: str, **subject**: str, **body**: str, **files**: List[str] = [] | str                   | Genera un mensaje en Jaime. Para los arhivos adjuntos es requerido que se utilice las rutas relativas iguales a como se las usa en el script |
| get_from_storage  | **path**: str  | bytes | Obtiene los bytes de un archivo dentro del storage |
| save_in_storage  | **path**: str, **content**: bytes | - | Guarda los bytes de un archivo dentro del storage |

---

## Algunos ejemplos

Para usar las tools solo hay que hacer un import en tu modulo

```python
import tools

resultado = tools.sh(cmd='ls', echo=False)

# PARAMETROS
parametros = tools.get_params()
variable = parametros['algo']['variable']


# NUEVO JOB
id_job = tools.new_jaime_job('repositorio', 'modulo_prueba', 'OPENSHIFT', {
    'algo': {
        'variable': variable
    }
}, 'nombre_del_job')


# CREACION DE MENSAJE
tools.sh('mkdir files')
tools.sh('echo "hola mundo" > files/archivo.txt')
id_message = tools.new_message('titulo', 'sub titulo', 'Soy un mensaje muy feliz :)', ['files/archivo.txt'])

```

Para mas ejemplos se puede consultar el repositorio de scripts creados para Jaime [en este link](https://github.com/jaime-project/repo-jaime-modules)

---

## :leftwards_arrow_with_hook: Navegar

* [Volver atras](../README.md)
