import 'package:flutter/material.dart';
import 'third_screen.dart'; // Pastikan untuk mengimpor ThirdScreen sesuai dengan nama file

class SecondScreen extends StatefulWidget {
  final String nameFromFirstScreen;
  const SecondScreen({required this.nameFromFirstScreen, Key? key})
      : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  late String selectedUserName = widget.nameFromFirstScreen;

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
            Text('Name: ${widget.nameFromFirstScreen}'),
            Text(
                'Selected User Name: $selectedUserName'), // Updated dynamically
            ElevatedButton(
              onPressed: () async {
                final selectedUser = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ThirdScreen()),
                );
                if (selectedUser != null) {
                  setState(() {
                    selectedUserName =
                        selectedUser; // Update the selected user name
                  });
                }
              },
              child: const Text('Choose a User'),
            ),
          ],
        ),
      ),
    );
  }
}
