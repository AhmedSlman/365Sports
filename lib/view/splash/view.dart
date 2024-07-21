import 'package:flutter/material.dart';
import 'package:sportat/const/dimensions.dart';
import 'package:sportat/core/router/router.dart';
import 'package:sportat/translations/locale_keys.g.dart';
import 'package:sportat/view/chooseLanguage/view.dart';
import 'package:sportat/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) => Stack(
            children: [
              Image.asset(
                'assets/images/splash.png',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              Center(child: Image.asset('assets/images/logo.png')),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: sizeFromHeight(0.95),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(
                      text: LocaleKeys.Splash_start.tr(),
                      fontSize: 14,
                      fontColor: Colors.white,
                      onPress: () => MagicRouter.navigateTo( ChooseLanguageView(),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
