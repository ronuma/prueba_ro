import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prueba_ro/screens/loading_screen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/material.dart';
import 'package:prueba_ro/services/widgets.dart';

//Acceso a los links en firestore y guardarlos en una lista de forma local.

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

final CollectionReference videos = _firestore.collection('videoIds');

class VideoPlayer extends StatefulWidget {
  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

//AQUÍ ESTÁ EL PEDO
class _VideoPlayerState extends State<VideoPlayer> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: videos.snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LoadingScreen();
        }
        final ids = snapshot.data.docs;
        List<VideoCard> videoWidgets = [];
        for (var id in ids) {
          final String videoId = id.data()['id'];
          print(id.data());
          YoutubePlayerController _controller = YoutubePlayerController(
            initialVideoId: videoId,
            flags: YoutubePlayerFlags(
              autoPlay: false,
            ),
          );
          final YoutubePlayer video = YoutubePlayer(
            controller: _controller,
            aspectRatio: 16 / 9,
          );
          print(_controller.metadata.runtimeType);
          final videoWidget =
              VideoCard(title: _controller.metadata.title, video: video);

          videoWidgets.add(videoWidget);
        }
        return ListView(
          children: videoWidgets,
        );
      },
    );
  }
}
