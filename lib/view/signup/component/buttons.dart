// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportat/core/router/router.dart';
import 'package:sportat/translations/locale_keys.g.dart';
import 'package:sportat/view/signup/controller.dart';
import 'package:sportat/view/signup/states.dart';
import 'package:sportat/view/welcome/view.dart';
import 'package:sportat/widgets/custom_button.dart';
import 'package:sportat/widgets/loading_indicator.dart';
import 'package:easy_localization/easy_localization.dart';

class SignupButtons extends StatefulWidget {
  const SignupButtons({Key? key}) : super(key: key);

  @override
  _SignupButtonsState createState() => _SignupButtonsState();
}

class _SignupButtonsState extends State<SignupButtons> {
  @override
  Widget build(BuildContext context) {
    final controller = SignUpController.of(context);
    return Column(
      children: [
        BlocBuilder(
          bloc: controller,
          builder: (context, state) => state is SignUpLoading
              ? const LoadingIndicator()
              : CustomButton(
                  text: LocaleKeys.SignUp_next.tr(),
                  fontColor: Colors.white,
                  onPress: controller.signup,
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
        // SocialButton(
        //   faceBookTap: () {},
        //   googleTap: () {},
        //   twitterTap: () {},
        // ),
      ],
    );
  }
}
