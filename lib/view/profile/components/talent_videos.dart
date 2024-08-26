import 'package:flutter/material.dart';
import 'package:sportat/const/base_url.dart';
import 'package:sportat/view/profile/controller.dart';
import 'package:sportat/widgets/custom_text.dart';
import 'package:sportat/widgets/video_card.dart';

class TalentVideos extends StatelessWidget {
  const TalentVideos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = ProfileController.of(context).videos;

    return controller.isEmpty
        ? const SizedBox(
            child: CustomText(
              text: 'No Videos Yet',
              alignment: Alignment.center,
            ),
          )
        : ListView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: controller.length,
            itemBuilder: (BuildContext context, int index) => VideoCard(
              id: controller[index].id,
              image: getBaseUrl + controller[index].videos!,
              usrImage: controller[index].clientImage == null
                  ? 'https://fourthpyramidagcy.net/sportat/uploads/thumbnails/talent/profileImage/2022-01-24/default.jpeg-_-1643020873.jpeg'
                  : getBaseUrl + controller[index].clientImage!,
              name: controller[index].name,
              date: controller[index].createdAt,
              viewsNumber: controller[index].views.toString(),
              videoTitle: controller[index].title,
              isLive: true,
            ),
          );
  }
}
