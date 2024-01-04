// Importa los paquetes necesarios de Flutter.
import 'package:flutter/foundation.dart';
import 'package:to_do_app/models/todo_model.dart';

// Define la clase TodoListNotifier que extiende de ChangeNotifier.
// ChangeNotifier es una clase de Flutter que te permite notificar a los oyentes (widgets) sobre los cambios.
class HomeScreenViewModel extends ChangeNotifier {
  // Lista privada de tareas (ToDo).
  // El guión bajo (_) al principio hace que la lista sea privada, lo que significa que solo se puede acceder a ella desde esta clase.
  List<ToDo> _todos = [];

  // Un getter público para _todos.
  // Permite a otros widgets o clases leer la lista de tareas, pero no modificarla directamente.
  List<ToDo> get todos => _todos.where((todo) => todo.isDone == false).toList();

  // Método para añadir una nueva tarea a la lista.
  void addTodo(ToDo todo) {
    // Añade la tarea pasada como argumento al final de la lista _todos.
    _todos.add(todo);

    // Notifica a todos los oyentes (en este caso, widgets que dependen de este estado) que se ha actualizado.
    // Esto es crucial para la actualización automática de la UI cuando el estado cambia.
    notifyListeners();
  }
  void updateTodo(
    ToDo todo,
    bool isDone,
  ) {
    // Busca la tarea pasada como argumento en la lista _todos.
    // Si la encuentra, actualiza el estado de la tarea.
    // Esto es crucial para la actualización automática de la UI cuando el estado cambia.
    _todos[_todos.indexOf(todo)].isDone = isDone;
    notifyListeners();
  }

}
