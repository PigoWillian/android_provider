import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_internsuitmedia/provider/palindrome_provider.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PalindromeProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Second Screen')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Welcome', style: TextStyle(fontSize: 24)),
            SizedBox(height: 16),
            Text('Name: ${provider.name}', style: TextStyle(fontSize: 18)),
            Text('Selected User: ${provider.selectedUserName}',
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/third');
              },
              child: Text('Choose a User'),
            ),
          ],
        ),
      ),
    );
  }
}
