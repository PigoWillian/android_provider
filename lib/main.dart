import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_internsuitmedia/provider/palindrome_provider.dart';
import 'package:flutter_application_internsuitmedia/screens/first_screen.dart';
import 'package:flutter_application_internsuitmedia/screens/second_screen.dart';
import 'package:flutter_application_internsuitmedia/screens/third_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PalindromeProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FirstScreen(),
        routes: {
          '/second': (context) => SecondScreen(),
          '/third': (context) => ThirdScreen(),
        },
      ),
    );
  }
}
