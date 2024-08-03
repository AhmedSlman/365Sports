import 'package:flutter/material.dart';
import 'package:sportat/const/dimensions.dart';
import 'package:sportat/core/appStorage/app_storage.dart';
import 'package:sportat/core/router/router.dart';
import 'package:sportat/translations/locale_keys.g.dart';
import 'package:sportat/view/chooseLanguage/view.dart';
import 'package:sportat/view/navBar/view.dart';
import 'package:sportat/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    navigateToLogin();
  }

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
                // ignore: prefer_const_constructors
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    // CustomButton(
                    //   text: LocaleKeys.Splash_start.tr(),
                    //   fontSize: 14,
                    //   fontColor: Colors.white,
                    //   onPress: () => MagicRouter.navigateTo(
                    //     const ChooseLanguageView(),
                    //   ),
                    // )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void navigateToLogin() {
    Future.delayed(const Duration(seconds: 4), () {
      AppStorage.isLogged
          ? MagicRouter.navigateAndPopAll(const ChooseLanguageView())
          : MagicRouter.navigateAndPopAll(const NavBarView());
    });
  }
}
