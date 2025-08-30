import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/music_page.dart';
import 'pages/chat_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Map<String, dynamic> userInfo = {
    "isLogin": false,
    "username": "",
    "ID": 0,
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      title: 'Hybrid',
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        '/music': (context) => const MusicPage(),
        '/chat': (context) => const ChatPage(),
      },
    );
  }
}
