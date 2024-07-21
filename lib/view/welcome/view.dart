import 'package:flutter/material.dart';
import 'package:sportat/const/dimensions.dart';
import 'package:sportat/core/router/router.dart';
import 'package:sportat/translations/locale_keys.g.dart';
import 'package:sportat/view/login/view.dart';
import 'package:sportat/view/loginAsGuest/view.dart';
import 'package:sportat/view/signup/view.dart';
import 'package:sportat/widgets/back_button.dart';
import 'package:sportat/widgets/custom_button.dart';
import 'package:sportat/widgets/custom_text.dart';
import 'package:sportat/widgets/custom_text_button.dart';
import 'package:easy_localization/easy_localization.dart';


class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/splash.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: sizeFromHeight(5)),
                    alignment: getAlignment(context),
                    child:const CustomBackButton(),
                  ),
                  Center(child: Image.asset('assets/images/logo.png')),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomButton(
                    text: LocaleKeys.Welcome_talent.tr(),
                    onPress: () => MagicRouter.navigateTo(const LoginView()),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                    text: LocaleKeys.Welcome_guest.tr(),
                    buttonColor: Colors.white,
                    fontColor: Colors.black,
                    onPress: ()=>MagicRouter.navigateTo(const LoginGuestView()),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       CustomText(
                        text: LocaleKeys.Welcome_donnt_have.tr(),
                        fontSize: 13,
                        color: Colors.black,
                      ),
                      CustomTextButton(
                        text: LocaleKeys.Welcome_sign_up.tr(),
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        onPressed: () =>
                            MagicRouter.navigateTo(const SignupView()),
                        color: Colors.black,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
