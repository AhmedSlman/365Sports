import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sportat/const/colors.dart';
import 'package:sportat/const/dimensions.dart';
import 'package:sportat/core/appStorage/app_storage.dart';
import 'package:sportat/core/router/router.dart';
import 'package:sportat/translations/locale_keys.g.dart';
import 'package:sportat/view/videoDetails/view.dart';
import 'package:sportat/widgets/alert_dialog.dart';
import 'package:sportat/widgets/custom_text.dart';
import 'package:sportat/widgets/custom_text_button.dart';
import 'package:video_player/video_player.dart';
import 'package:easy_localization/easy_localization.dart';

class VideoCard extends StatefulWidget {
  final String? image;
  final String? usrImage;

  final String? videoDuration;
  final int? id;
  final String? videoTitle;

  final String? name;

  final String? date;
  final VoidCallback? onTap;
  final String? viewsNumber;
  final bool isLive;

  const VideoCard({
    Key? key,
    this.image = '',
    this.videoDuration,
    this.videoTitle,
    this.name,
    this.date,
    this.viewsNumber,
    this.usrImage,
    this.id,
    this.onTap,
    this.isLive = false,
  }) : super(key: key);

  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  VideoPlayerController? controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(widget.image!)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
        // controller!.setLooping(true);
        controller?.pause();
        // controller!.play();
      });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (controller!.value.isPlaying) {
          controller!.pause();
          AppStorage.isLogged || AppStorage.isGuestLogged
              ? MagicRouter.navigateTo(
                  VideoDetailsView(id: widget.id, image: widget.image))
              : showAlertDilog();
        } else {
          AppStorage.isLogged || AppStorage.isGuestLogged
              ? MagicRouter.navigateTo(
                  VideoDetailsView(id: widget.id, image: widget.image))
              : showAlertDilog();
        }
      },

      // onTap: () => AppStorage.isLogged || AppStorage.isGuestLogged
      //     ? MagicRouter.navigateTo(
      //         VideoDetailsView(id: widget.id, image: widget.image))
      //     : showAlertDilog(),
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        color: Colors.white,
        child: Column(
          children: [
            if (controller!.value.isInitialized)
              GestureDetector(
                onTap: () {
                  widget.onTap;
                  setState(() {
                    if (controller!.value.isPlaying) {
                      controller!.pause();
                    } else {
                      controller!.play();
                    }
                  });
                },
                child: Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: 1 / .6,
                      child: VideoPlayer(controller!),
                    ),
                    controller!.value.isPlaying
                        ? const Text("")
                        : Positioned(
                            top: 0,
                            bottom: 0,
                            right: sizeFromWidth(2) - 10,
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.black.withOpacity(1),
                              child: const Icon(Icons.play_arrow),
                            )),
                    Positioned(
                        bottom: 0,
                        child: SizedBox(
                            width: sizeFromWidth(1),
                            child: VideoProgressIndicator(controller!,
                                allowScrubbing: true))),
                  ],
                ),
              )
            else
              SizedBox(
                height: sizeFromHeight(3),
                child: shimmer(
                  child: Container(
                    width: double.infinity,
                    color: Colors.white,
                  ),
                ),
              ),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: Column(
                children: [
                  ListTile(
                    title: CustomText(
                      text: widget.videoTitle!,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    // trailing: CustomText(
                    //   text: videoDuration!,
                    //   fontSize: 12,
                    //   color: const Color(0xff949494),
                    // ),
                  ),
                  ListTile(
                    title: CustomText(
                      text: widget.name!,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    leading: CircleAvatar(
                      radius: 29,
                      backgroundColor: Colors.grey,
                      backgroundImage: NetworkImage(widget.usrImage!),
                    ),
                    subtitle: Column(
                      children: [
                        CustomText(
                          text: widget.viewsNumber!,
                          alignment: getAlignment(context),
                          fontSize: 12,
                          color: darkGrey,
                        ),
                        CustomText(
                          text: widget.date!,
                          alignment: getAlignment(context),
                          fontSize: 12,
                          color: darkGrey,
                        ),
                      ],
                    ),
                    trailing: widget.isLive == true
                        ? SizedBox()
                        : Column(
                            children: [
                              InkWell(
                                child: CustomText(
                                  text: LocaleKeys.report.tr(),
                                  color: Colors.red,
                                  fontSize: 14,
                                ),
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: CustomText(
                                        text: LocaleKeys.report.tr(),
                                        color: Colors.red,
                                        fontSize: 16,
                                      ),
                                      content: CustomText(
                                        text: LocaleKeys.reportThisVideo.tr(),
                                        fontSize: 14,
                                      ),
                                      actions: [
                                        CustomTextButton(
                                          text: LocaleKeys.confirm.tr(),
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                content: CustomText(
                                                  text: LocaleKeys.weWillReview
                                                      .tr(),
                                                  fontSize: 14,
                                                ),
                                              ),
                                            );
                                          },
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                              AppStorage.isLogged
                                  ? SizedBox()
                                  : InkWell(
                                      child: CustomText(
                                        text: LocaleKeys.block.tr(),
                                        color: Colors.red,
                                        fontSize: 14,
                                      ),
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            title: CustomText(
                                              text: LocaleKeys.block.tr(),
                                              color: Colors.red,
                                              fontSize: 16,
                                            ),
                                            content: CustomText(
                                              text: LocaleKeys.reportThisVideo
                                                  .tr(),
                                              fontSize: 14,
                                            ),
                                            actions: [
                                              CustomTextButton(
                                                text: LocaleKeys.confirm.tr(),
                                                onPressed: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) =>
                                                        AlertDialog(
                                                      content: CustomText(
                                                        text: LocaleKeys
                                                            .youcannot
                                                            .tr(),
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    )
                            ],
                          ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller!.dispose();
  }
}
