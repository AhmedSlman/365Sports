import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sportat/const/colors.dart';
import 'package:sportat/const/dimensions.dart';
import 'package:sportat/core/appStorage/app_storage.dart';
import 'package:sportat/core/router/router.dart';
import 'package:sportat/translations/locale_keys.g.dart';
import 'package:sportat/view/videoDetails/view.dart';
import 'package:sportat/widgets/alert_dialog.dart';
import 'package:sportat/widgets/custom_text.dart';
import 'package:sportat/widgets/custom_text_button.dart';
import 'package:sportat/widgets/video_manager.dart';
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
    controller = VideoPlayerController.networkUrl(Uri.parse(widget.image!))
      ..initialize().then((_) {
        setState(() {});
        controller?.pause();
      });
  }

  @override
  Widget build(BuildContext context) {
    final videoManager = VideoManager.of(context);

    return GestureDetector(
      onTap: () {
        if (controller!.value.isPlaying) {
          controller!.pause();
        }
        AppStorage.isLogged || AppStorage.isGuestLogged
            ? MagicRouter.navigateTo(
                VideoDetailsView(id: widget.id, image: widget.image))
            : showAlertDilog();
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        color: Colors.white,
        child: Column(
          children: [
            if (controller!.value.isInitialized)
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (controller!.value.isPlaying) {
                      controller!.pause();
                    } else {
                      // Notify VideoManager to pause the current active video
                      videoManager?.setActiveController(controller);
                      controller!.play();
                    }
                  });
                },
                child: Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: controller!.value.aspectRatio,
                      child: VideoPlayer(controller!),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: IconButton(
                        icon: const Icon(Icons.fullscreen),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FullScreenVideoPlayer(
                                controller: controller!,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    if (!controller!.value.isPlaying)
                      Positioned(
                        top: 0,
                        bottom: 0,
                        right: sizeFromWidth(2) - 10,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white.withOpacity(0.8),
                          child: const Icon(Icons.play_arrow,color: primaryColor,),
                        ),
                      ),
                    Positioned(
                      bottom: 0,
                      child: SizedBox(
                        width: sizeFromWidth(1),
                        child: VideoProgressIndicator(
                          controller!,
                          allowScrubbing: true,
                        ),
                      ),
                    ),
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
                        ? const SizedBox()
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
                                  ? const SizedBox()
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
    controller!.dispose();
    super.dispose();
  }
}

//Full Screen Widget
class FullScreenVideoPlayer extends StatefulWidget {
  final VideoPlayerController controller;

  const FullScreenVideoPlayer({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _FullScreenVideoPlayerState createState() => _FullScreenVideoPlayerState();
}

class _FullScreenVideoPlayerState extends State<FullScreenVideoPlayer> {
  @override
  void initState() {
    super.initState();

    // Rotate the screen to landscape mode when entering full-screen
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);

    // Hide the notification bar and enable immersive mode
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  @override
  void dispose() {
    // Restore the screen orientation to portrait mode when exiting full-screen
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    // Restore the system UI overlays when exiting full-screen
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                if (widget.controller.value.isPlaying) {
                  widget.controller.pause();
                } else {
                  widget.controller.play();
                }
              });
            },
            child: Container(
              color: Colors.black,
              child: Center(
                child: AspectRatio(
                  aspectRatio: widget.controller.value.aspectRatio,
                  child: VideoPlayer(widget.controller),
                ),
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: IconButton(
              icon: const Icon(Icons.fullscreen_exit),
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
