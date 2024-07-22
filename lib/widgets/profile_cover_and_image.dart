import 'package:flutter/material.dart';
import 'package:sportat/const/dimensions.dart';
import 'package:sportat/core/appStorage/app_storage.dart';
import 'package:sportat/translations/locale_keys.g.dart';
import 'package:sportat/view/profile/widgets/edit_container.dart';
import 'package:sportat/widgets/back_button.dart';
import 'package:sportat/widgets/custom_text_button.dart';
import 'package:easy_localization/easy_localization.dart';

class CoverAndImage extends StatelessWidget {
  final bool? isPageSettings;

  const CoverAndImage(
      {Key? key,
      this.isPageSettings,
      this.image = '',
      this.cover = '',
      this.onTapCover,
      this.onTapProfile,
      this.onPressed,
      this.isSearch})
      : super(key: key);
  final String image;
  final String cover;
  final VoidCallback? onTapCover;
  final VoidCallback? onTapProfile;
  final VoidCallback? onPressed;
  final bool? isSearch;

  @override
  Widget build(BuildContext context) {
    final double circleRadius = sizeFromHeight(5);
    return Container(
      color: Colors.white,
      height: sizeFromHeight(2.9),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: sizeFromWidth(1),
            height: circleRadius,
            decoration: BoxDecoration(
              borderRadius: profileCoverRadius,
              image: DecorationImage(
                image: NetworkImage(cover),
                fit: BoxFit.cover,
              ),
            ),
          ),
          isPageSettings == false
              ? const Text("")
              : Positioned(
                  top: circleRadius / 2,
                  left: context.locale == const Locale("en")
                      ? 15
                      : sizeFromWidth(1) - 79,
                  child: const CustomBackButton()),
          isPageSettings == false
              ? const Text("")
              : Positioned(
                  top: circleRadius - 10,
                  right: context.locale == const Locale("en")
                      ? 35
                      : sizeFromWidth(1) - 44 - 35,
                  child: EditContainer(
                    onTap: onTapCover,
                  )),
          isPageSettings == false
              ? const Text("")
              : Positioned(
                  top: circleRadius + circleRadius / 2 - 25,
                  right: context.locale == const Locale("en")
                      ? 35
                      : sizeFromWidth(1) - 44 - 44,
                  child: CustomTextButton(
                    onPressed: () => AppStorage.signOut(),
                    text: LocaleKeys.Settings_log_out.tr(),
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  )),
          Positioned(
            top: circleRadius / 2,
            child: Container(
              width: circleRadius,
              height: circleRadius,
              decoration: const ShapeDecoration(
                  shape: CircleBorder(), color: Colors.white),
              child: DecoratedBox(
                decoration: ShapeDecoration(
                    shape: const CircleBorder(),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(image),
                    )),
              ),
            ),
          ),
          isPageSettings == false
              ? const Text("")
              : Positioned(
                  top: circleRadius + circleRadius / 2 - 10,
                  child: Padding(
                    padding: context.locale == const Locale("en")
                        ? EdgeInsets.only(left: circleRadius / 2)
                        : EdgeInsets.only(right: circleRadius / 2),
                    child: EditContainer(
                      onTap: onTapProfile,
                    ),
                  )),
          isPageSettings == true
              ? const Text("")
              : isSearch == true
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      child: Align(
                        alignment: getAlignment(context),
                        child: const CustomBackButton(),
                      ),
                    )
                  : Positioned(
                      left: 30,
                      top: circleRadius,
                      child: IconButton(
                        onPressed: onPressed,
                        // onPressed: () =>
                        //     MagicRouter.navigateTo(const SettingsView()),
                        icon: const Icon(
                          Icons.settings_rounded,
                          color: Color(0xff949494),
                        ),
                      ))
        ],
      ),
    );
  }
}
