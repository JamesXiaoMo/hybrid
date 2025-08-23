import 'package:flutter/material.dart';
import 'components/app_drawer.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hybrid',
      home: const MyHomePage(title: 'Hybrid'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int pageIndex = 0;

  void onPageChanged(int newIndex) {
    setState(() {
      pageIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          widget.title +
              () {
                switch (pageIndex) {
                  case 0:
                    return " - 主页";
                  case 1:
                    return " - 音乐";
                  case 2:
                    return " - 聊天";
                  default:
                    return "";
                }
              }(),
          style: TextStyle(
            color: const Color.fromARGB(255, 235, 235, 235),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: AppDrawer(pageIndex: pageIndex, onPageChanged: onPageChanged),
      body: () {
        switch (pageIndex) {
          case 0:
            return const HomePage();
          case 1:
            return const Center(child: Text('Music Page'));
          case 2:
            return const Center(child: Text('Chat Page'));
          default:
            return const Center(child: Text('Page not found'));
        }
      }(),
    );
  }
}
