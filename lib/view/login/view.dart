import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportat/const/colors.dart';
import 'package:sportat/core/router/router.dart';
import 'package:sportat/view/login/component/buttons.dart';
import 'package:sportat/view/login/component/text_fields.dart';
import 'package:sportat/view/login/controller.dart';
import 'package:sportat/view/welcome/view.dart';
import 'package:sportat/widgets/custom_app_bar.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginController(),
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
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
                  children: [
                    LoginTextFields(),
                    LoginButtons(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
