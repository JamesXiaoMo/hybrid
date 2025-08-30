import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromARGB(200, 33, 150, 243),
            ),
            child: Image.asset(
              'assets/images/icon.png',
              width: 100,
              height: 100,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/');
            },
            style: ButtonStyle(
              overlayColor: WidgetStateProperty.all(
                Colors.lightBlue.withAlpha(50),
              ),
              // backgroundColor: WidgetStateProperty.all(
              //   widget.pageIndex == 0
              //       ? Colors.lightBlue.withAlpha(50)
              //       : Colors.transparent,
              // ),
            ),
            child: const Text(
              "主页",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/music');
            },
            style: ButtonStyle(
              overlayColor: WidgetStateProperty.all(
                Colors.lightBlue.withAlpha(50),
              ),
              // backgroundColor: WidgetStateProperty.all(
              //   widget.pageIndex == 1
              //       ? Colors.lightBlue.withAlpha(50)
              //       : Colors.transparent,
              // ),
            ),
            child: const Text(
              "音乐",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/chat');
            },
            style: ButtonStyle(
              overlayColor: WidgetStateProperty.all(
                Colors.lightBlue.withAlpha(50),
              ),
              // backgroundColor: WidgetStateProperty.all(
              //   widget.pageIndex == 2
              //       ? Colors.lightBlue.withAlpha(50)
              //       : Colors.transparent,
              // ),
            ),
            child: const Text(
              "聊天",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
