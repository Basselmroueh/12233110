
import 'package:flutter/material.dart';
import 'flashcards.dart';
import 'flashcards_screen.dart';

void main() {
  shuffleFlashcards();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Language Flashcards',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.white60,
        cardColor: Colors.blue,
      ),
      home: const FlashcardScreen(),
    );
  }
}