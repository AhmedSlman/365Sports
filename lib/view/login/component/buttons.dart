import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportat/const/dimensions.dart';
import 'package:sportat/core/appStorage/app_storage.dart';
import 'package:sportat/core/router/router.dart';
import 'package:sportat/translations/locale_keys.g.dart';
import 'package:sportat/view/ForgetPassword/view.dart';
import 'package:sportat/view/login/controller.dart';
import 'package:sportat/view/login/states.dart';
import 'package:sportat/widgets/custom_button.dart';
import 'package:sportat/widgets/custom_text.dart';
import 'package:sportat/widgets/custom_text_button.dart';
import 'package:sportat/widgets/loading_indicator.dart';
import 'package:sportat/widgets/socail_button.dart';
import 'package:easy_localization/easy_localization.dart';

class LoginButtons extends StatelessWidget {
  const LoginButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = LoginController.of(context);
    return Column(
      children: [
        CustomTextButton(
          text: LocaleKeys.LogIn_forget_password.tr(),
          color: Colors.black,
          alignment: getAlignment(context),
          fontSize: 10,
          onPressed: () => MagicRouter.navigateTo(const ForgetPasswordView()),
        ),
        BlocBuilder(
          bloc: controller,
          builder: (context, state) =>
          state is LoginLoading
              ? const LoadingIndicator()
              : CustomButton(
            text: LocaleKeys.LogIn_log_in.tr(),
            fontSize: 15,
            onPress: controller.login,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        // CustomText(
        //   text: LocaleKeys.LogIn_or.tr(),
        //   fontSize: 15,
        // ),
        // const SizedBox(
        //   height: 15,
        // ),
        // SignInWithAppleButton(
        //   onPressed: () async {
        //     final credential = await SignInWithApple.getAppleIDCredential(
        //       scopes: [
        //         AppleIDAuthorizationScopes.email,
        //         AppleIDAuthorizationScopes.fullName,
        //       ],
        //     );
        //
        //     print(credential);
        //
        //     // Now send the credential (especially `credential.authorizationCode`) to your server to create a session
        //     // after they have been validated with Apple (see `Integration` section for more information on how to do this)
        //   },
        // ),
        // const SizedBox(
        //   height: 15,
        // ),
        // SocialButton(
        //   faceBookTap: () {
        //     AppStorage.launchURL('https://365sportat.com/auth/redirect/facebook');
        //   },
        //   googleTap: () {},
        //   twitterTap: () {},
        // ),
      ],
    );
  }
}
