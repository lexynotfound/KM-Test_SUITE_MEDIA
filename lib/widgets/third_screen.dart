import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});
  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  List<dynamic> userList = []; // List to store user data

  Future<void> fetchUsers() async {
    final response = await http
        .get(Uri.parse('https://reqres.in/api/users?page=1&per_page=10'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      setState(() {
        userList = jsonData['data']; // Assigning user data to the list
      });
    } else {
      throw Exception('Failed to load users');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUsers(); // Fetching user data when the screen initializes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User List')),
      body: RefreshIndicator(
        onRefresh: () => fetchUsers(), // Refresh logic when pulling the screen
        child: userList.isEmpty
            ? const Center(child: Text('No users available'))
            : ListView.builder(
                itemCount: userList.length,
                itemBuilder: (context, index) {
                  final user = userList[index];
                  return ListTile(
                    title: Text('${user['first_name']} ${user['last_name']}'),
                    onTap: () {
                      Navigator.pop(
                          context,
                          user[
                              'first_name']); // Sending back selected user name
                    },
                  );
                },
              ),
      ),
    );
  }
}

