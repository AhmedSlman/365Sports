import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sportat/const/dimensions.dart';
import 'package:sportat/translations/locale_keys.g.dart';
import 'package:sportat/view/pinCode/controller.dart';
import 'package:sportat/widgets/custom_text.dart';
import 'package:easy_localization/easy_localization.dart';


class PinCodeAppBar extends StatelessWidget {
  const PinCodeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller=PinCodeController.of(context);
    return Column(
      children:  [
        CustomText(
          text: LocaleKeys.PinCode_confirm_your_phone_number.tr(),
          fontSize: 20,
          fontWeight: FontWeight.bold,
          alignment: getAlignment(context),
        ),
        const SizedBox(height: 10,),
        CustomText(
          text: '${LocaleKeys.PinCode_please_enter.tr()} ${controller.isGuest?controller.email:controller.phone}',
          fontSize: 14,
          alignment: getAlignment(context),
        ),
      ],
    );
  }
}
