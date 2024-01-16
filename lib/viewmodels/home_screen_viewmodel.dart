// Importa los paquetes necesarios de Flutter.
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:to_do_app/models/todo_model.dart';
import 'package:path_provider/path_provider.dart';

enum TodoStatus { all, active, completed }

// Define la clase TodoListNotifier que extiende de ChangeNotifier.
// ChangeNotifier es una clase de Flutter que te permite notificar a los oyentes (widgets) sobre los cambios.
class HomeScreenViewModel extends ChangeNotifier {
  HomeScreenViewModel(){
    setup();
  }
  // Lista privada de tareas (ToDo).
  // El guión bajo (_) al principio hace que la lista sea privada, lo que significa que solo se puede acceder a ella desde esta clase.
  List<ToDo> _todos = [];
  late Isar _isar;
  setup() async {
    await setUpDb();
  }

  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;

  void toggleDarkMode() {
    _themeMode = _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }

  void filter (TodoStatus filter){
    switch(filter){
      case TodoStatus.all:
        {
          _isar.toDos.where().findAll().then((toDos) {
            _todos = toDos;
            debugPrint('todos: $_todos');

          });
          break;
        }
      case TodoStatus.active:{
        _isar.toDos.where().filter().isDoneEqualTo(false).findAll().then((toDos) {
          _todos = toDos;
          debugPrint('todos:pendientes $_todos');

        });
      }
      break;

      case TodoStatus.completed:
       {
            _isar.toDos.where().filter().isDoneEqualTo(true).findAll().then((toDos) {
              _todos = toDos;
              debugPrint('todos: listos $_todos');

            });
            break;

       }
    }
    notifyListeners();
  }


  Future<void> setUpDb() async {
    Directory appDocDirectory = await getApplicationDocumentsDirectory();
    String rootDir = '';
   await  new Directory(appDocDirectory.path+'/'+'isar').create(recursive: true)
// The created directory is returned as a Future.
        .then((Directory directory) {
      rootDir = directory.path;
      print('Path of New Dir: '+directory.path);
    });
    print('rootDir: $rootDir');

   _isar = await Isar.open(
      [ToDoSchema],
      directory: rootDir,
    );
    _isar.toDos.where().filter().isDoneEqualTo(false).findAll().then((toDos) {
      _todos = toDos;
      debugPrint('todos: $_todos');
      notifyListeners();
    });
  }

  // Un getter público para _todos.
  // Permite a otros widgets o clases leer la lista de tareas, pero no modificarla directamente.
  List<ToDo> get todos => _todos;

  // Método para añadir una nueva tarea a la lista.
  void addTodo(ToDo todo) {
    // Añade la tarea pasada como argumento al final de la lista _todos.
    print(todo.id);
    _todos.add(todo);
    _isar.writeTxn(() async {
      await _isar.toDos.put(todo);

    });

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
    _isar.writeTxn(() async {
      await _isar.toDos.put(todo);
    });
    notifyListeners();
  }

}
