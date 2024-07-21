import 'package:flutter/material.dart';
import 'package:sportat/const/colors.dart';
import 'package:sportat/translations/locale_keys.g.dart';
import 'package:sportat/widgets/custom_text.dart';
import 'package:easy_localization/easy_localization.dart';

class EditContainer extends StatelessWidget {
  const EditContainer({Key? key, this.onTap}) : super(key: key);
final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          color: lightGrey,
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        width: 44,
        height: 25,
        child: Center(
            child: CustomText(
          text: LocaleKeys.Settings_edit.tr(),
          decoration: TextDecoration.underline,
          fontSize: 11,
        )),
      ),
    );
  }
}
