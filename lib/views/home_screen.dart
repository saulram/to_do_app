// Importa los paquetes necesarios de Flutter y Provider.
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/viewmodels/home_screen_viewmodel.dart';

import '../models/todo_model.dart';

// HomeScreen es un StatefulWidget. Los StatefulWidget son útiles cuando la parte de la UI que estás creando
// necesita mantener un estado que pueda cambiar durante la vida útil del widget.
class HomeScreen extends StatefulWidget {
  // Constructor con una clave opcional.
  // Las claves se usan para controlar si se debe reemplazar o actualizar un widget en el árbol de widgets.
  const HomeScreen({super.key});

  @override
  // Crea el estado para este StatefulWidget.
  State<HomeScreen> createState() => _HomeScreenState();
}

// Esta es la clase de estado para HomeScreen.
// Aquí es donde se define la lógica y la interfaz de usuario interna para este StatefulWidget.
class _HomeScreenState extends State<HomeScreen> {
  // Declara una variable para el ViewModel.
  // HomeScreenViewModel es donde se almacena y se maneja el estado para esta pantalla.
  late HomeScreenViewModel _viewModel;
  ToDo todo = ToDo(
    title: '',
    description: '',
  );

  @override
  void initState() {
    super.initState();
    // Aquí puedes inicializar cualquier dato necesario para el estado del widget.
  }

  @override
  Widget build(BuildContext context) {
    // Usa Provider para obtener el HomeScreenViewModel del contexto.
    // Esto permite acceder al estado y la lógica definida en HomeScreenViewModel.
    // El parámetro 'listen: true' indica que este widget se reconstruirá cada vez que el ViewModel notifique cambios.
    _viewModel = Provider.of<HomeScreenViewModel>(context, listen: true);

    // Construye la interfaz de usuario para este widget.
    // Scaffold es un layout para la estructura visual principal de la pantalla.
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          // Cuando el usuario pulsa el botón flotante, muestra un diálogo para añadir una nueva tarea.
          showDialog(
            context: context,
            builder: (BuildContext context) {
              // El diálogo es un AlertDialog.
              return AlertDialog(
                title: const Text('Nueva tarea'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Los campos de texto para el título y la descripción de la tarea.
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Título',
                      ),
                      onChanged: (String value) {
                        // Cuando el usuario escribe en el campo de texto, actualiza el título de la tarea.
                       setState(() {
                          todo.title = value;
                       });
                      },
                    ),
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Descripción',
                      ),
                      onChanged: (String value) {
                        // Cuando el usuario escribe en el campo de texto, actualiza la descripción de la tarea.
                        setState(() {
                          todo.description = value;
                        });
                      },
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      // Cuando el usuario pulsa el botón, añade una nueva tarea a la lista.
                      _viewModel.addTodo(todo);
                      setState(() {
                        todo = ToDo(
                          title: '',
                          description: '',
                        );
                      });
                      // Cierra el diálogo.
                      Navigator.of(context).pop();
                    },
                    child: const Text('Añadir'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      // Body define el contenido principal de Scaffold.
      body: _viewModel.todos.isEmpty ? Center(
        child: Text('No hay tareas, comienza agregando una'),

      ) :ListView.builder(
        itemCount: _viewModel.todos.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(_viewModel.todos[index].title),
            subtitle: Text(_viewModel.todos[index].description),
            trailing: Checkbox(
              value: _viewModel.todos[index].isDone,
              onChanged: (bool? value) {
                // Cuando el usuario cambia el valor del checkbox, llama al método updateTodo del ViewModel.
                // Esto actualiza el estado de la tarea y notifica a los oyentes (widgets) que se ha actualizado.
                _viewModel.updateTodo(
                  _viewModel.todos[index],
                  value!,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
