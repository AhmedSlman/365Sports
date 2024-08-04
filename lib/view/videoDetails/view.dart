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

class VideoDetailsView extends StatefulWidget {
  const VideoDetailsView({Key? key, this.id, this.image}) : super(key: key);
  final int? id;
  final String? image;

  @override
  State<VideoDetailsView> createState() => _VideoDetailsViewState();
}

class _VideoDetailsViewState extends State<VideoDetailsView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          VideoDetailsController()..getVideoDetails(widget.id),
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
                        text: VideoDetailsController.of(context)
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
          builder: (BuildContext context, state) => state is VideoDetailsLoading
              ? const LoadingIndicator()
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      VoteVideo(id: widget.id, image: widget.image),
                      Comment(id: widget.id),
                      const CommentResult()
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
