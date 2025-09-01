import 'package:flutter/material.dart';
import '../apis/api_service.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicSearchWidget extends StatefulWidget {
  const MusicSearchWidget({super.key});

  @override
  State<MusicSearchWidget> createState() => _MusicSearchWidgetState();
}

class _MusicSearchWidgetState extends State<MusicSearchWidget> {
  List<Map<String, dynamic>> searchedSongs = [];
  List<Map<String, dynamic>> songsInfo = [];
  late TextEditingController _controller;
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    _controller.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  void _playSong(String url) {
    _audioPlayer.play(UrlSource(url));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        Row(
          children: [
            SizedBox(width: MediaQuery.of(context).size.width * 0.01),
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: '搜索音乐',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                final results = await ApiService().searchSong(_controller.text);
                setState(() {
                  searchedSongs = List<Map<String, dynamic>>.from(
                    results['result'],
                  );
                });
              },
              child: Text('搜索'),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.01),
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: searchedSongs.length,
            itemBuilder: (context, index) {
              final song = searchedSongs[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 3,
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () async {
                    final songInfo = await ApiService().getSong(
                      song['id'].toString(),
                    );
                    _playSong(songInfo['url']);
                  },
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          song["picUrl"],
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              song['name'],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              song['artists'],
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.chevron_right, color: Colors.grey),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
