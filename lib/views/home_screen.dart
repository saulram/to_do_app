// Importa los paquetes necesarios de Flutter y Provider.
import 'package:flutter/material.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/common/neumorphic_container.dart';
import 'package:to_do_app/theme/theme.dart';
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
    ThemeData theme = Theme.of(context);

    // Construye la interfaz de usuario para este widget.
    // Scaffold es un layout para la estructura visual principal de la pantalla.
    return Scaffold(
      floatingActionButton: NeumorphicFloatingActionButton(
        style: NeumorphicStyle(
          depth:-4,
          intensity: 0.7,
          color: theme.scaffoldBackgroundColor,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(16)),
          shadowDarkColor: theme.shadowColor,
          shadowLightColor: theme.shadowColor,

        ),
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
                    Neumorphic(
                      style: NeumorphicStyle(
                        depth: -4,
                        intensity: 0.7,
                        color: theme.scaffoldBackgroundColor,
                        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(16)),
                        shadowDarkColor: theme.shadowColor,
                        shadowLightColor: theme.shadowColor,

                      ),
                      child: TextField(
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
                    ),
                    SizedBox(height: 16,),
                    Neumorphic(
                      style: NeumorphicStyle(
                        depth: -4,
                        intensity: 0.7,
                        color: theme.scaffoldBackgroundColor,
                        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(16)),
                        shadowDarkColor: theme.shadowColor,
                        shadowLightColor: theme.shadowColor,

                      ),
                      child: TextField(
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
                    ),
                  ],
                ),
                actions: [
                  NeumorphicButton(
                    style: NeumorphicStyle(
                      depth: 4,
                      intensity: 0.6,
                      color: theme.scaffoldBackgroundColor,
                      boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(16)),
                      shadowDarkColor: theme.shadowColor,
                      shadowLightColor: theme.shadowColor,

                    ),
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
                    child:  Text('Añadir',style: theme.textTheme.labelLarge),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),

      // Body define el contenido principal de Scaffold.
      appBar: AppBar(

        title: const Text('Tareas'),
        leading: GestureDetector(child: Icon(context.isDarkMode ? Icons.light_mode : Icons.dark_mode),
        onTap: (){
          _viewModel.toggleDarkMode();
        },),
        actions: [
          // El botón de acción de la AppBar permite al usuario filtrar las tareas por estado.
          PopupMenuButton(
            onSelected: (TodoStatus value) {
              // Cuando el usuario selecciona un elemento del menú emergente, actualiza el filtro.
              _viewModel.filter(value);
            },
            itemBuilder: (BuildContext context) {
              // El menú emergente muestra tres opciones: Mostrar todas las tareas, Mostrar tareas completadas y Mostrar tareas pendientes.
              return [
                 PopupMenuItem(
                  value: TodoStatus.all,
                  child: Text('Todas las tareas',style: theme.textTheme.bodyMedium,),
                ),
                 PopupMenuItem(
                  value: TodoStatus.active,
                  child: Text('Pendientes',style: theme.textTheme.bodyMedium),
                ),
                 PopupMenuItem(
                  value: TodoStatus.completed,
                  child: Text('Completadas',style: theme.textTheme.bodyMedium),
                ),
              ];
            },
          ),
        ],
      ),
      body: _viewModel.todos.isEmpty ? Center(
        child: Text('No hay tareas, comienza agregando una'),

      ) :Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Por Hacer: ${_viewModel.todos.length}'),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: _viewModel.todos.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Neumorphic(
                    style: NeumorphicStyle(
                      depth: 4,
                      intensity: 0.7,
                      color: theme.scaffoldBackgroundColor,
                      boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(16)),
                      shadowDarkColor: theme.shadowColor,
                      shadowLightColor: theme.shadowColor,

                    ),
                    child: ListTile(
                      title: Text(_viewModel.todos[index].title,style: theme.textTheme.titleMedium,),
                      subtitle: Text(_viewModel.todos[index].description ?? '',style: theme.textTheme.bodyMedium),
                      trailing: Switch.adaptive(

                        value: _viewModel.todos[index].isDone,
                        onChanged: (value) {
                          print(value);
                          // Cuando el usuario cambia el valor del checkbox, llama al método updateTodo del ViewModel.
                          // Esto actualiza el estado de la tarea y notifica a los oyentes (widgets) que se ha actualizado.
                          _viewModel.updateTodo(
                            _viewModel.todos[index],
                            value!,
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
