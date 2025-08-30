import 'package:flutter/material.dart';
import '../components/app_drawer_widget.dart';
import '../components/login_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          "Hybrid - 主页",
          style: TextStyle(
            color: const Color.fromARGB(255, 235, 235, 235),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: AppDrawer(),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Container(
                constraints: BoxConstraints.tightFor(
                  width: MediaQuery.of(context).size.width * 0.45,
                  height: MediaQuery.of(context).size.height * 0.4,
                ),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.1),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: LoginWidget(),
              ),
            ],
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.03),
          Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Container(
                constraints: BoxConstraints.tightFor(
                  width: MediaQuery.of(context).size.width * 0.45,
                  height: MediaQuery.of(context).size.height * 0.4,
                ),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.1),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Text("Home Page 2"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
