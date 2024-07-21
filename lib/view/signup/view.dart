import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportat/const/colors.dart';
import 'package:sportat/core/router/router.dart';
import 'package:sportat/view/signup/component/buttons.dart';
import 'package:sportat/view/signup/component/terms_privacy.dart';
import 'package:sportat/view/signup/component/text_fields.dart';
import 'package:sportat/view/signup/controller.dart';
import 'package:sportat/view/welcome/view.dart';
import 'package:sportat/widgets/custom_app_bar.dart';

class SignupView extends StatelessWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpController(),
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              primaryColor,
              secColor,
            ]),
          ),
          child: ListView(
            children: [
              CustomAppBar(
                onPressed: () => MagicRouter.navigateTo(const WelcomeView()),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: const Column(
                  children: [SignupTextFields(), AgreeWith(), SignupButtons()],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
