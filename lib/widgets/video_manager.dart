import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoManager extends StatefulWidget {
  final Widget child;

  const VideoManager({Key? key, required this.child}) : super(key: key);

  static VideoManagerState? of(BuildContext context) {
    return context.findAncestorStateOfType<VideoManagerState>();
  }

  @override
  VideoManagerState createState() => VideoManagerState();
}

class VideoManagerState extends State<VideoManager> {
  VideoPlayerController? _activeController;

  void setActiveController(VideoPlayerController? controller) {
    if (_activeController != null && _activeController != controller) {
      _activeController?.pause();
    }
    setState(() {
      _activeController = controller;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
