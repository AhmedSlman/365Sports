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
    return CoverAndImage(
      isPageSettings: false,
      image: ProfileController.of(context).profileModel?.data?.profileImage ==
              null
          ? 'https://fourthpyramidagcy.net/sportat/uploads/thumbnails/talent/profileImage/2022-01-24/default.jpeg-_-1643020873.jpeg'
          : getBaseUrl +
              ProfileController.of(context).profileModel!.data!.profileImage!,
      cover: controller.profileModel!.data!.cover == null
          ? ''
          : getBaseUrl + controller.profileModel!.data!.cover!,
      onPressed: () => MagicRouter.navigateTo(
        SettingsView(
          personalInfoModel: ProfileController.of(context).personalInfoModel,
        ),
      ),
      isSearch: controller.isSearch,
    );
  }
}
