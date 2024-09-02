import 'package:flutter/material.dart';
import 'package:sportat/const/base_url.dart';
import 'package:sportat/core/router/router.dart';
import 'package:sportat/view/profile/controller.dart';
import 'package:sportat/view/settings/view.dart';
import 'package:sportat/widgets/profile_cover_and_image.dart';

class AppBarImage extends StatelessWidget {
  const AppBarImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = ProfileController.of(context);
    final profileImage = controller.profileModel?.data?.profileImage;
    final coverImage = controller.profileModel?.data?.cover;

    return CoverAndImage(
      isPageSettings: false,
      image: profileImage == null
          ? 'https://fourthpyramidagcy.net/sportat/uploads/thumbnails/talent/profileImage/2022-01-24/default.jpeg-_-1643020873.jpeg'
          : getBaseUrl + profileImage,
      cover: coverImage == null ? '' : getBaseUrl + coverImage,
      onPressed: () => MagicRouter.navigateTo(
        SettingsView(
          personalInfoModel: controller.personalInfoModel,
        ),
      ),
      isSearch: controller.isSearch,
    );
  }
}
