import 'package:flutter/material.dart';
import '../../widgets/second_Screen.dart';


class FirstScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController sentenceController = TextEditingController();

  FirstScreen({super.key});

  bool isPalindrome(String text) {
    // Function to check if a sentence is palindrome or not
    String formattedText = text.toLowerCase().replaceAll(' ', '');
    String reversedText = formattedText.split('').reversed.join('');
    return formattedText == reversedText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('Login')),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(int.parse('0xFF4992A5')), // Wedgewood
              Color(int.parse('0xFF839EA9')), // Gumbo
              Color(int.parse('0xFF7096A6')), // Gothic
              // Add other colors here if needed
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(controller: nameController, decoration: const InputDecoration(labelText: 'Name')),
              TextField(controller: sentenceController, decoration: const InputDecoration(labelText: 'Sentence')),
              ElevatedButton(
                onPressed: () {
                  String sentence = sentenceController.text;
                  bool palindrome = isPalindrome(sentence);
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text('Palindrome Check'),
                      content: Text(palindrome ? 'isPalindrome' : 'not palindrome'),
                    ),
                  );
                },
                child: const Text('Check'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SecondScreen()),
                  );
                },
                child: const Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
