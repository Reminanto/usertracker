import 'package:flutter/material.dart';
import 'package:usertracker/expenses.dart';

void main() {
  runApp(const MyApp());
}

//var kDarkColorScheme =
   // ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 5, 99, 125),
   //   brightness: Brightness.dark,
   // );

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    //  darkTheme: ThemeData.dark().copyWith(
      
      //  colorScheme: kColorScheme,
       // appBarTheme: const AppBarTheme().copyWith(
        //  backgroundColor: kDarkColorScheme.onPrimaryContainer,
       //   foregroundColor: kDarkColorScheme.onPrimary,
       // ),
      //  cardTheme: const CardTheme().copyWith(
        //  color: kDarkColorScheme.secondaryContainer,
        //  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      //  ),
       // elevatedButtonTheme: ElevatedButtonThemeData(
       //   style: ElevatedButton.styleFrom(
       //     backgroundColor: kDarkColorScheme.primaryContainer,
       //     foregroundColor: kDarkColorScheme.onPrimaryContainer
      //    ),
      //  ),
      //  textTheme: const TextTheme().copyWith(
      //    titleLarge: TextStyle(
      //      fontWeight: FontWeight.normal,
      //      fontSize: 14,
      //      color: kColorScheme.onSecondaryContainer,
       //   ),
      //  ),
     // ),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.onPrimary,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),
        textTheme: const TextTheme().copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 14,
            color: kColorScheme.onSecondaryContainer,
          ),
        ),
      ),
    //  themeMode: ThemeMode.system,
      home: const Expenses(),
    );
  }
}
