import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/viewmodels/home_screen_viewmodel.dart';
import 'package:to_do_app/views/home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) {
        return HomeScreenViewModel();
      },
      child: const ToDoApp()),);
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo App  - Provider',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
