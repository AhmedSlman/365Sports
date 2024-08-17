import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportat/const/base_url.dart';
import 'package:sportat/view/settings/controller.dart';
import 'package:sportat/widgets/profile_cover_and_image.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = SettingsController.of(context);
    return BlocBuilder(
      bloc: controller,
      builder: (context, state) => CoverAndImage(
        isPageSettings: true,
        image: controller.personalInfoModel!.data!.user!.profileImage == null
            ? 'https://fourthpyramidagcy.net/sportat/uploads/thumbnails/talent/profileImage/2022-01-24/default.jpeg-_-1643020873.jpeg'
            : getBaseUrl +
                controller.personalInfoModel!.data!.user!.profileImage!,
        cover: controller.personalInfoModel!.data!.user!.cover == null
            ? ''
            : getBaseUrl + controller.personalInfoModel!.data!.user!.cover!,
        onTapCover: SettingsController.of(context).editCover,
        onTapProfile: SettingsController.of(context).editProfilePicture,
      ),
    );
  }
}
