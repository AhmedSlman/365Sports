import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sportat/core/router/router.dart';
import 'package:sportat/translations/locale_keys.g.dart';
import 'package:sportat/widgets/custom_text.dart';
import 'package:easy_localization/easy_localization.dart';

showSuccessVerification() async {
  await showDialog(
    context: MagicRouter.currentContext,
    builder: (context) => AlertDialog(
      title: CustomText(
        text: LocaleKeys.PinCode_verification_success.tr(),
        fontSize: 24,
        textAlign: TextAlign.center,
      ),
      content: Lottie.asset('assets/images/78457-success-message-gold.json'),
    ),
  );
}
