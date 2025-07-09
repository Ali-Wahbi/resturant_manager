import 'package:flutter/material.dart';
import 'Menu_select.dart';

void main() {
  runApp(const ResturantApp());
}

class ResturantApp extends StatelessWidget {
  const ResturantApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 90, 52, 206),
        ),
        scaffoldBackgroundColor: Color.fromARGB(255, 231, 203, 255),
      ),
      home: const MenuSelectScreen(title: 'Flutter Demo Home Page'),
    );
  }
}

// enum FoodType { mainDish, sideDish, beverage, salad }
