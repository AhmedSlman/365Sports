// ignore_for_file: deprecated_member_use

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sportat/const/base_url.dart';
import 'package:sportat/const/colors.dart';
import 'package:sportat/const/dimensions.dart';
import 'package:sportat/translations/locale_keys.g.dart';
import 'package:sportat/view/videoDetails/controller.dart';
import 'package:sportat/view/videoDetails/states.dart';
import 'package:sportat/view/videoDetails/widget/text_widget.dart';
import 'package:sportat/widgets/custom_button.dart';
import 'package:sportat/widgets/custom_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:video_player/video_player.dart';

class VoteVideo extends StatefulWidget {
  const VoteVideo({Key? key, this.id, this.image}) : super(key: key);
  final int? id;
  final String? image;

  @override
  State<VoteVideo> createState() => _VoteVideoState();
}

class _VoteVideoState extends State<VoteVideo> {
  VideoPlayerController? videoController;

  @override
  void initState() {
    super.initState();
    videoController = VideoPlayerController.network(widget.image!)
      ..initialize().then((_) {
        setState(() {});
        videoController!.setLooping(false);

        videoController!.play();
      });
  }

  @override
  void dispose() {
    super.dispose();
    videoController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = VideoDetailsController.of(context);

    final video = controller.videoPage?.data;
    return BlocListener<VideoDetailsController, VideoDetailsStates>(
      listener: (context, state) {
        if (state is AddingComment) {
          if (videoController!.value.isPlaying) {
            videoController?.pause();
          }
        }
      },
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            videoController!.value.isInitialized
                ? GestureDetector(
                    onTap: () {
                      controller.addView(widget.id);
                      setState(() {
                        if (videoController!.value.isPlaying) {
                          videoController!.pause();
                        } else {
                          videoController!.play();
                        }
                      });
                    },
                    child: Stack(
                      children: [
                        AspectRatio(
                          aspectRatio: 1 / 1.3,
                          child: VideoPlayer(videoController!),
                        ),
                        videoController!.value.isPlaying
                            ? const Text("")
                            : Positioned(
                                top: 0,
                                bottom: 0,
                                right: sizeFromWidth(2) - 10,
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor:
                                      Colors.white.withOpacity(0.8),
                                  child: const Icon(Icons.play_arrow,
                                      color: primaryColor),
                                )),
                        Positioned(
                            bottom: 0,
                            child: SizedBox(
                                width: sizeFromWidth(1),
                                child: VideoProgressIndicator(videoController!,
                                    allowScrubbing: true))),
                      ],
                    ),
                  )
                : SizedBox(
                    height: sizeFromHeight(3),
                    child: shimmer(
                      child: Container(
                        width: double.infinity,
                        color: Colors.white,
                      ),
                    ),
                  ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: sizeFromHeight(20),
                            width: sizeFromWidth(5),
                            child: CustomButton(
                                text: controller.isVoted == 1
                                    ? LocaleKeys.VideoDetails_voted.tr()
                                    : LocaleKeys.VideoDetails_vote.tr(),
                                borderColor: controller.isVoted == 1
                                    ? secColor
                                    : Colors.black,
                                buttonColor: controller.isVoted == 1
                                    ? secColor
                                    : Colors.white,
                                fontColor: Colors.black,
                                verticalPadding: 5,
                                fontSize: 12,
                                onPress: () {
                                  controller.addOrRemoveVote(widget.id);
                                  // if (videoController != null) {
                                  //   if (videoController!.value.isPlaying) {
                                  //     videoController?.pause();
                                  //     controller.addOrRemoveVote(widget.id);
                                  //   }
                                  // } else {
                                  //   controller.addOrRemoveVote(widget.id);
                                  // }
                                }),
                          ),
                          const SizedBox(
                            width: 13,
                          ),
                          SizedBox(
                            height: sizeFromHeight(20),
                            width: sizeFromWidth(5),
                            child: CustomButton(
                              verticalPadding: 5,
                              text: LocaleKeys.VideoDetails_share.tr(),
                              fontSize: 10,
                              fontColor: Colors.white,
                              onPress: () {
                                final videoPage = controller.videoPage;
                                final videoData = videoPage?.data;
                                final videos = videoData?.videos;

                                if (videos != null && videos.isNotEmpty) {
                                  Share.share(getBaseUrl + videos);
                                } else {
                                  if (kDebugMode) {
                                    print(
                                        '*********No video data available.****************');
                                  }
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      TextWidget(
                        text: LocaleKeys.VideoDetails_votes.tr(),
                        number: video != null ? video.votes.toString() : '0',
                      ),
                      TextWidget(
                        text: LocaleKeys.VideoDetails_views.tr(),
                        number: video?.views.toString() ?? '0',
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(video?.clientImage == null
                          ? 'https://fourthpyramidagcy.net/sportat/uploads/thumbnails/talent/profileImage/2022-01-24/default.jpeg-_-1643020873.jpeg'
                          : getBaseUrl + video!.clientImage!),
                    ),
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: video?.tags ?? "",
                          // text: '#${video?.tags}',
                          color: secColor,
                          fontSize: 12,
                        ),
                        const SizedBox(
                          height: 1,
                        ),
                        CustomText(
                          text: video?.name ?? "",
                          fontSize: 14,
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                      ],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: video?.createdAt ?? "",
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                        const SizedBox(
                          height: 1,
                        ),
                        CustomText(
                          text: video?.description ?? '',
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
