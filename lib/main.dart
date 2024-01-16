import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff94A3B8)),
        scaffoldBackgroundColor: const Color(0xffF1F5F9),
        shadowColor: const Color(0xffB8CCE0),
        popupMenuTheme: PopupMenuThemeData(
          color: const Color(0xffF1F5F9),
          textStyle: GoogleFonts.poppins(
            color: Color(0xff36597D),
            fontWeight: FontWeight.bold,
          ),
        ),
        appBarTheme: AppBarTheme(
          color: const Color(0xffF1F5F9),
          elevation: 0,
          iconTheme: IconThemeData(
            color: Color(0xff36597D),
          ),
          titleTextStyle: GoogleFonts.poppins(
            color: Color(0xff36597D),
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        dialogTheme: DialogTheme(
          backgroundColor: const Color(0xffF1F5F9),
          elevation: 0,
          titleTextStyle: GoogleFonts.poppins(
            color: Color(0xff36597D),
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
          contentTextStyle: GoogleFonts.poppins(
            color: Color(0xff36597D),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: const Color(0xffF1F5F9),
          filled: true,
          hintStyle: GoogleFonts.poppins(
            color: Color(0xff36597D),
            fontWeight: FontWeight.bold,
          ),
          labelStyle: GoogleFonts.poppins(
            color: Color(0xff36597D),
            fontWeight: FontWeight.bold,
          ),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(
              Color(0xff36597D),
            ),
            overlayColor: MaterialStateProperty.all(
              Color(0xff36597D),
            ),
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: const Color(0xffF1F5F9),
          foregroundColor: const Color(0xff36597D),
        ),
        textTheme: TextTheme(
          titleMedium: GoogleFonts.poppins(
            color: Color(0xff36597D),
            fontWeight: FontWeight.bold,
          ),
          titleLarge: TextStyle(
            color: Color(0xff36597D),
            fontFamily: 'Poppins',
          ),
          titleSmall: TextStyle(
            color: Color(0xff36597D),
          ),
          displaySmall: TextStyle(
            color: Color(0xff36597D),
          ),
          displayMedium: TextStyle(
            color: Color(0xff36597D),
          ),
          displayLarge: TextStyle(
            color: Color(0xff36597D),
          ),
          labelSmall: TextStyle(
            color: Color(0xff36597D),
          ),
          labelMedium: TextStyle(
            color: Color(0xff36597D),
          ),
          labelLarge: TextStyle(
            color: Color(0xff36597D),
          ),
          headlineSmall: TextStyle(
            color: Color(0xff36597D),
          ),
          headlineMedium: TextStyle(
            color: Color(0xff36597D),
          ),
          headlineLarge: TextStyle(
            color: Color(0xff36597D),
          ),
          bodySmall: TextStyle(
            color: Color(0xff36597D),
          ),
          bodyMedium: TextStyle(
            color: Color(0xff36597D),
          ),
          bodyLarge: TextStyle(
            color: Color(0xff36597D),
          ),

        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: const Color(0xff334155),
        popupMenuTheme: PopupMenuThemeData(
          color: const Color(0xff334155),
          textStyle: GoogleFonts.poppins(
            color: Color(0xff94A3B8),
            fontWeight: FontWeight.bold,
          ),
        ),
        dialogTheme: DialogTheme(
          backgroundColor: const Color(0xff334155),
          elevation: 0,
          titleTextStyle: GoogleFonts.poppins(
            color: Color(0xff94A3B8),
            fontWeight: FontWeight.bold,
            fontSize: 24,

          ),
          contentTextStyle: GoogleFonts.poppins(
            color: Color(0xff94A3B8),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: const Color(0xff334155),
          filled: true,
          hintStyle: GoogleFonts.poppins(
            color: Color(0xff94A3B8),
            fontWeight: FontWeight.bold,
          ),
          labelStyle: GoogleFonts.poppins(
            color: Color(0xff94A3B8),
            fontWeight: FontWeight.bold,
          ),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(
              Color(0xff94A3B8),

            ),
            overlayColor: MaterialStateProperty.all(
              Color(0xff94A3B8),
            ),
          ),
        ),
        appBarTheme: AppBarTheme(
          color: const Color(0xff334155),
          titleTextStyle: GoogleFonts.poppins(
            color: Color(0xff94A3B8),
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
          elevation: 0,
          iconTheme: IconThemeData(
            color: Color(0xff94A3B8),
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: const Color(0xff334155),
          foregroundColor: const Color(0xff94A3B8),
        ),
        shadowColor: const Color(0xff222C39),
        textTheme: TextTheme(
          bodySmall: TextStyle(
            color: Color(0xff94A3B8),
          ),
          bodyMedium: TextStyle(
            color: Color(0xff94A3B8),
          ),
          bodyLarge: TextStyle(
            color: Color(0xff94A3B8),
          ),
          headlineSmall: TextStyle(
            color: Color(0xff94A3B8),
          ),
          headlineMedium: TextStyle(
            color: Color(0xff94A3B8),
          ),
          headlineLarge: TextStyle(
            color: Color(0xff94A3B8),
          ),
          labelLarge: TextStyle(
            color: Color(0xff94A3B8),
          ),
          labelMedium: TextStyle(
            color: Color(0xff94A3B8),
          ),
          labelSmall: TextStyle(
            color: Color(0xff94A3B8),
          ),
          displayLarge: TextStyle(
            color: Color(0xff94A3B8),
          ),
          displayMedium: TextStyle(
            color: Color(0xff94A3B8),
          ),
          displaySmall: TextStyle(
            color: Color(0xff94A3B8),
          ),
          titleSmall: TextStyle(
            color: Color(0xff94A3B8),
          ),
          titleMedium: GoogleFonts.poppins(
            color: Color(0xff94A3B8),
            fontWeight: FontWeight.bold,

          ),
          titleLarge: TextStyle(
            color: Color(0xff94A3B8),
          ),

        ),

        useMaterial3: true,
      ),
      themeMode: Provider.of<HomeScreenViewModel>(context).themeMode,
      home: const HomeScreen(),
    );
  }
}
