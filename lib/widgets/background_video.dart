import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class BackGroundVideo extends StatefulWidget {
  @override
  _BackGroundVideoState createState() => _BackGroundVideoState();
}

class _BackGroundVideoState extends State<BackGroundVideo> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://www9.nhk.or.jp/das/movie/D0002160/D0002160757_00000_V_000.mp4')
      ..initialize().then((_) {
        // TODO: ここでプレイしようとすると止まる
        //_controller.play();
        _controller.setLooping(true);
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _controller.value.initialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : Container(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
