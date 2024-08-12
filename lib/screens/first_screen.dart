import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_internsuitmedia/provider/palindrome_provider.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController sentenceController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text('Palindrome Checker')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: sentenceController,
              decoration: InputDecoration(labelText: 'Sentence'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final sentence = sentenceController.text;
                final isPalindrome = _isPalindrome(sentence);
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(isPalindrome ? 'Palindrome' : 'Not Palindrome'),
                    content: Text(isPalindrome
                        ? 'The sentence is a palindrome'
                        : 'The sentence is not a palindrome'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              child: Text('Check'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Provider.of<PalindromeProvider>(context, listen: false)
                    .setName(nameController.text);
                Navigator.of(context).pushNamed('/second');
              },
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }

  bool _isPalindrome(String sentence) {
    final cleanedSentence =
        sentence.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '').toLowerCase();
    final reversedSentence = cleanedSentence.split('').reversed.join('');
    return cleanedSentence == reversedSentence;
  }
}
