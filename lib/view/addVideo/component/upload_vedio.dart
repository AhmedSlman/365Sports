import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sportat/const/colors.dart';
import 'package:sportat/const/dimensions.dart';
import 'package:sportat/translations/locale_keys.g.dart';
import 'package:sportat/view/addVideo/controller.dart';
import 'package:sportat/view/addVideo/states.dart';
import 'package:sportat/view/addVideo/widget/upload_way_container.dart';
import 'package:easy_localization/easy_localization.dart';

class UploadVideo extends StatelessWidget {
  const UploadVideo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = AddVideoController.of(context);
    return Container(
      height: sizeFromHeight(5),
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffE1E1E1), width: 1),
          borderRadius: const BorderRadius.all(Radius.circular(6))),
      child: BlocBuilder(
        bloc: controller,
        builder: (context, state) =>
            state is CameraLoading || controller.file != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LinearPercentIndicator(
                        width: 250.0,
                        animation: true,
                        isRTL: isEn(context) ? false : true,
                        barRadius: Radius.circular(4),
                        animationDuration: 2000,
                        lineHeight: 25.0,
                        percent: 1.0,
                        center: Text('100%'),
                        linearStrokeCap: LinearStrokeCap.butt,
                        progressColor: secColor,
                      ),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      UploadWayContainer(
                        text: LocaleKeys.UploadVideo_upload.tr(),
                        text1: LocaleKeys.UploadVideo_video.tr(),
                        image: "assets/images/upload.png",
                        onTap: () => controller.getVideo(false),
                      ),
                      UploadWayContainer(
                        image: "assets/images/camera.png",
                        text: LocaleKeys.UploadVideo_record.tr(),
                        text1: LocaleKeys.UploadVideo_video.tr(),
                        onTap: () => controller.getVideo(true),
                      ),
                    ],
                  ),
      ),
    );
  }
}
