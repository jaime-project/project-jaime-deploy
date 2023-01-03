# :tools: Herramientas de los agentes

Explica el uso de la libreria de **tools** para la creacion de modulos

---

## Uso de las tools

Para usar las tools solo hay que hacer un import en tu modulo

```python
import tools

resultado = tools.sh('echo "hola mundo redondo"')
```

## Funciones de las tools

| Funcion           | Parametros                                                                                    | Salida                | Descripcion                                               |
| ---               | ---                                                                                           | ---                   | ---                                                       |
| sh                | **cmd**: str, **echo**: bool = true                                                           | str                   | Ejecuta un comando en bash y devuelve el resultado        |
| ssh               | **server_name**: str, **cmd**: str, **echo**: bool = True                                     | str                   | Ejecuta un comando por ssh y devuelve el resultado        |
| get_clusters_name | -                                                                                             | List[str]             | Devuelve la lista de los cluster agregados en Jaime       |
| get_servers_name  | -                                                                                             | List[str]             | Devuelve la lista de los servers agregados en Jaime       |
| get_params        | -                                                                                             | Dict[str, object]     | Devuelve los parametros cargados al work en el yaml       |
| login_openshift   | **cluster_name**: str                                                                         | bool                  | Logea en openshift y devuelve true si se pudo loguear     |
| login_kubernetes  | **cluster_name**: str                                                                         | bool                  | Logea en kubernetes y devuelve true si se pudo loguear    |
| new_jaime_job    | **repo_name**: str, **module_name**: str, **agent_type**: str, **params**: Dict[str, object] = {}, **name**: str = uuid4() | str                   | Ejecuta una tarea en Jaime, devuelve el id del work creado |

---

## Algunos ejemplos

Para usar las tools solo hay que hacer un import en tu modulo

```python
import tools

resultado = tools.sh(cmd:'ls', echo=False)

# ...
# yaml de parametros
#
# algo:
#   variable: 'hola mundo'
# ...
parametros = tools.get_params()
variable = parametros['algo']['variable']

id_job = new_jaime_job('repositorio', 'modulo_prueba', 'OPENSHIFT', {
    'algo': {
        'variable': 'hola mundo redondo'
    }
}, 'nombre_del_job')
```

---

## :leftwards_arrow_with_hook: Navegar

* [Volver atras](../README.md)
