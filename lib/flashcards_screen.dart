import 'package:flutter/material.dart';
import 'flashcards.dart';
import 'add_flashcard_dialoged.dart';

class FlashcardScreen extends StatefulWidget {
  const FlashcardScreen({super.key});

  @override
  FlashcardScreenState createState() => FlashcardScreenState();
}

class FlashcardScreenState extends State<FlashcardScreen> {
  int currentIndex = 0;
  bool isFlipped = false;

  void flipCard() {
    setState(() {
      isFlipped = !isFlipped;
    });
  }

  void nextCard() {
    setState(() {
      currentIndex = (currentIndex + 1) % flashcards.length;
      isFlipped = false;
    });
  }

  void addFlashcard(String word, String translation) {
    setState(() {
      flashcards.add({'word': word, 'translation': translation});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Italian Language Flashcards',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: GestureDetector(
          onTap: flipCard,
          child: Card(
            elevation: 4,
            color: isFlipped
                ? Colors.purple
                : Colors.blue,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Container(
              padding: const EdgeInsets.all(24),
              width: 300,
              height: 200,
              alignment: Alignment.center,
              child: Text(
                isFlipped
                    ? flashcards[currentIndex]['translation'] ?? ''
                    : flashcards[currentIndex]['word'] ?? '',
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: FloatingActionButton(
                onPressed: () => showAddFlashcardDialog(context, addFlashcard),
                backgroundColor: Colors.red,
                tooltip: 'Add New Flashcard',
                child: const Icon(Icons.add)
            ),
          ),
          FloatingActionButton.extended(
            onPressed: nextCard,
            label: const Text('Next Word'),
            icon: const Icon(Icons.navigate_next),
            backgroundColor: const Color(0xFF3E3E3E),
          ),
        ],
      ),
    );
  }
}
