import 'package:flutter/material.dart';
import 'package:km_test_suite_media/widgets/third_Screen.dart';


class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});
  final String nameFromFirstScreen =
      ''; // Assign the name from the first screen here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text('Welcome'),
            const SizedBox(height: 20.0),
            Text('Name from First Screen: $nameFromFirstScreen'),
            const Text('Selected User Name: '), // This will be updated dynamically
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ThirdScreen()),
                );
              },
              child: const Text('Choose a User'),
            ),
          ],
        ),
      ),
    );
  }
}
