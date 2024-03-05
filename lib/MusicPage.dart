import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:url_launcher/url_launcher.dart';

class MusicPage extends StatefulWidget {
  @override
  _MusicPageState createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  late AudioPlayer audioPlayer;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
  }

  void playPause() {
    if (isPlaying) {
      audioPlayer.pause();
    } else {
      audioPlayer.play(
        'https://open.spotify.com/playlist/37i9dQZF1DWTwnEm1IYyoj?si=9a31001de2994c2e' as Source, // Change the link to the Spotify playlist
      );
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lofi Music'),
        backgroundColor: const Color.fromARGB(255, 62, 59, 133), // Updated app bar color
      ),
      body: Container(
        color: Color.fromARGB(255, 72, 89, 167), // Background color
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/music_icon.png'), // Replace with your music icon
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Heavenly Lofi',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: playPause,
                style: ElevatedButton.styleFrom(
                  primary: Colors.teal[700], // Updated button color
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: Icon(
                  isPlaying ? Icons.pause : Icons.play_arrow,
                  size: 50,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Listen on Spotify',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  final uri = Uri(
                    scheme: 'https',
                    host: 'open.spotify.com',
                    path: '/playlist/37i9dQZF1DWTwnEm1IYyoj?si=9a31001de2994c2e', // Change the link to the Spotify playlist
                  );

                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Unable to open Spotify.'),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.teal[300], // Updated button color
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: Text(
                  'Open in Spotify',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }
}
