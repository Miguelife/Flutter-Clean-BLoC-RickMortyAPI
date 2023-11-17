///
/// By Miguel Ángel Soto González
/// 17/11/2023
///

import 'package:clean_rick_morty/presentation/pages/home/home_builder.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clean Rick & Morty App',
      debugShowCheckedModeBanner: false,
      home: HomeBuilder().build(),
    );
  }
}
