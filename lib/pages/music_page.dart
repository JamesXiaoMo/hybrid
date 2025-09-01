import 'package:flutter/material.dart';
import '../components/app_drawer_widget.dart';
import '../components/music_search_widget.dart';

class MusicPage extends StatelessWidget {
  const MusicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          "Hybrid - 音乐",
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
                  height: MediaQuery.of(context).size.height * 0.8,
                ),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.1),
                      spreadRadius: 10,
                      blurRadius: 10,
                      offset: Offset(3, 3),
                    ),
                  ],
                ),
                child: MusicSearchWidget(),
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
                  height: MediaQuery.of(context).size.height * 0.8,
                ),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.1),
                      spreadRadius: 10,
                      blurRadius: 10,
                      offset: Offset(3, 3),
                    ),
                  ],
                ),
                child: Text(
                  '当前播放',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
