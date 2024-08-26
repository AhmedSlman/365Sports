import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportat/const/colors.dart';
import 'package:sportat/core/router/router.dart';
import 'package:sportat/view/videoDetails/component/comment.dart';
import 'package:sportat/view/videoDetails/component/comment_result.dart';
import 'package:sportat/view/videoDetails/component/vote_video.dart';
import 'package:sportat/view/videoDetails/controller.dart';
import 'package:sportat/view/videoDetails/states.dart';
import 'package:sportat/widgets/custom_text.dart';
import 'package:sportat/widgets/loading_indicator.dart';
import 'package:video_player/video_player.dart';

class VideoDetailsView extends StatelessWidget {
  VideoDetailsView({Key? key, this.id, this.image}) : super(key: key);
  final int? id;
  final String? image;
  VideoPlayerController? controller;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
      VideoDetailsController()..getVideoDetails(id),
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(241, 241, 241, 1),
        appBar: AppBar(
          backgroundColor: primaryColor,
          leading: BackButton(
            color: Colors.black,
            onPressed: () async {
              MagicRouter.pop();
            },
          ),
          centerTitle: true,
          title: BlocBuilder<VideoDetailsController, VideoDetailsStates>(
            builder: (BuildContext context, state) =>
            state is VideoDetailsLoading
                ? const Text('')
                : CustomText(
              text: context
                  .read<VideoDetailsController>()
                  .videoPage
                  ?.data
                  ?.title ??
                  '',
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: BlocBuilder<VideoDetailsController, VideoDetailsStates>(
          builder: (BuildContext context, state) {
            if (state is VideoDetailsLoading) {
              return const LoadingIndicator();
            } else if (state is VideoDetailsInit) {
              final comments = context.read<VideoDetailsController>().comments;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    VoteVideo(id: id, image: image),
                    Comment(id: id),
                    CommentResult(
                      comments: comments,
                    ),
                  ],
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
