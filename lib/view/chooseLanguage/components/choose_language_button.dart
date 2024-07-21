import 'package:flutter/material.dart';
import 'package:sportat/core/router/router.dart';
import 'package:sportat/translations/locale_keys.g.dart';
import 'package:sportat/view/welcome/view.dart';
import 'package:sportat/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';

class ChooseLanguageButton extends StatelessWidget {
  const ChooseLanguageButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      child: CustomButton(
        text: LocaleKeys.ChooseLanguage_choose.tr(),
        fontSize: 15,
        onPress: ()=>MagicRouter.navigateTo(const WelcomeView()),
      ),
    );
  }
}
