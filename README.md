# Todo App

Una aplicación de Flutter para gestionar una lista de tareas (ToDo) utilizando `shared_preferences` para el almacenamiento local.

## Características

- Añadir nuevas tareas
- Marcar tareas como completadas
- Eliminar tareas
- Persistencia de datos utilizando `shared_preferences`

## Instalación

1. Clona este repositorio:
    ```sh
    git clone https://github.com/tu_usuario/todo_app.git
    ```
2. Navega al directorio del proyecto:
    ```sh
    cd todo_app
    ```
3. Instala las dependencias:
    ```sh
    flutter pub get
    ```

## Uso

1. Ejecuta la aplicación:
    ```sh
    flutter run
    ```

2. Interactúa con la interfaz para añadir, completar o eliminar tareas.

## Estructura del Proyecto

- `lib/main.dart`: Punto de entrada de la aplicación.
- `lib/todo_provider.dart`: Proveedor de estado para gestionar la lista de tareas.
- `lib/todo.dart`: Modelo de datos para las tareas.

## Ejemplo de Código

### Modelo de Tarea (`Todo`)

```dart
class Todo {
  String title;
  bool isDone;

  Todo({
    required this.title,
    this.isDone = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'isDone': isDone,
    };
  }

  static Todo fromJson(Map<String, dynamic> json) {
    return Todo(
      title: json['title'],
      isDone: json['isDone'],
    );
  }
}