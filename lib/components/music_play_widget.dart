import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicPlayWidget extends StatefulWidget {
  const MusicPlayWidget({super.key, required this.audioPlayer});

  final AudioPlayer audioPlayer;

  @override
  State<MusicPlayWidget> createState() => _MusicPlayWidgetState();
}

class _MusicPlayWidgetState extends State<MusicPlayWidget> {
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();

    widget.audioPlayer.onDurationChanged.listen((d) {
      setState(() => _duration = d);
    });

    widget.audioPlayer.onPositionChanged.listen((p) {
      setState(() => _position = p);
    });

    widget.audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() => _isPlaying = state == PlayerState.playing);
    });
  }

  Future<void> _togglePlay() async {
    if (_isPlaying) {
      await widget.audioPlayer.pause();
    } else {
      await widget.audioPlayer.resume();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          min: 0,
          max: _duration.inSeconds.toDouble(),
          value: _position.inSeconds.clamp(0, _duration.inSeconds).toDouble(),
          onChanged: (value) async {
            final newPosition = Duration(seconds: value.toInt());
            if (newPosition <= _duration) {
              await widget.audioPlayer.seek(newPosition);
            }
          },
        ),
      ],
    );
  }
}
