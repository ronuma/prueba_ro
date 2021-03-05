import 'package:flutter/material.dart';
import 'package:prueba_ro/services/video_player.dart';

//Pantalla de los videos

class VideoScreen extends StatefulWidget {
  static const String id = 'video_screen';

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'VIDEOS',
            style: TextStyle(
              color: Colors.lightGreen,
            ),
          ),
        ),
        body: VideoPlayer(),
      ),
    );
  }
}
