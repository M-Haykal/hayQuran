import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'quranModel.dart';

class QuranDetailPage extends StatefulWidget {
  final QuranModel quranModel;

  QuranDetailPage({required this.quranModel});

  @override
  _QuranDetailPageState createState() => _QuranDetailPageState();
}

class _QuranDetailPageState extends State<QuranDetailPage> {
  AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;

  @override
  void dispose() {
    _audioPlayer.dispose(); 
    super.dispose();
  }

  void _playPauseAudio() async {
    if (isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(UrlSource(widget.quranModel.audio));
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.quranModel.nama),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.quranModel.asma,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text("Arti: ${widget.quranModel.arti}"),
            SizedBox(height: 10),
            Text("Jumlah Ayat: ${widget.quranModel.ayat}"),
            SizedBox(height: 10),
            Text("Keterangan: ${widget.quranModel.keterangan}"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _playPauseAudio,
              child: Text(isPlaying ? "Pause Audio" : "Play Audio"),
            ),
          ],
        ),
      ),
    );
  }
}
