import 'package:flutter/material.dart';
import '../components/app_drawer_widget.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          "Hybrid - 聊天",
          style: TextStyle(
            color: const Color.fromARGB(255, 235, 235, 235),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: AppDrawer(),
      body: Center(child: Text('这里是聊天页', style: TextStyle(fontSize: 24))),
    );
  }
}
