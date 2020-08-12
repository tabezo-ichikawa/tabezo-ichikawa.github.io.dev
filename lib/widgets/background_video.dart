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
      ..initialize().then(
        (_) {
          _controller.setLooping(true);
          // muteしないとブラウザにはじかれるのでミュートしておく
          // ref -> https://developers.google.com/web/updates/2017/09/autoplay-policy-changes
          _controller.setVolume(0.0);
          _controller.play();
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.initialized
        ? SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                // ?. call in a null-safety way. sizeが !nullのときだけ呼び出し
                // ?? 左辺がnullのときは右辺を代入
                width: _controller.value.size?.width ?? 0,
                height: _controller.value.size?.height ?? 0,
                child: VideoPlayer(_controller),
              ),
            ),
          )
        : Container();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
