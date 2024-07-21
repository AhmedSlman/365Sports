import 'package:flutter/material.dart';
import 'package:sportat/const/colors.dart';
import 'package:sportat/const/dimensions.dart';
import 'package:sportat/core/router/router.dart';
import 'package:sportat/translations/locale_keys.g.dart';
import 'package:sportat/view/chooseLanguage/components/choose_language_button.dart';
import 'package:sportat/view/splash/view.dart';
import 'package:sportat/widgets/custom_app_bar.dart';
import 'package:sportat/widgets/custom_text.dart';
import 'components/app_languages.dart';
import 'package:easy_localization/easy_localization.dart';

class ChooseLanguageView extends StatefulWidget {
  const ChooseLanguageView({Key? key}) : super(key: key);

  @override
  State<ChooseLanguageView> createState() => _ChooseLanguageViewState();
}

class _ChooseLanguageViewState extends State<ChooseLanguageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              primaryColor,
              secColor,
            ],
          ),
        ),
        child: ListView(
          children: [
            CustomAppBar(
              onPressed: ()=>MagicRouter.navigateTo(const SplashView()),
            ),
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  CustomText(
                    text: LocaleKeys.ChooseLanguage_language.tr(),
                    fontSize: 20,
                    verticalMargin: 20,
                    fontWeight: FontWeight.bold,
                    alignment: getAlignment(context),
                  ),
                  const AppLanguage(),
                    ChooseLanguageButton()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
