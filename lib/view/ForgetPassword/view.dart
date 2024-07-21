import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportat/const/colors.dart';
import 'package:sportat/core/router/router.dart';
import 'package:sportat/view/ForgetPassword/component/buttons.dart';
import 'package:sportat/view/ForgetPassword/component/text_fileds.dart';
import 'package:sportat/view/ForgetPassword/controller.dart';
import 'package:sportat/view/login/view.dart';
import 'package:sportat/widgets/custom_app_bar.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>ForgetPasswordController(),
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
                onPressed: () => MagicRouter.navigateTo(const LoginView()),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: const [
                    ForgetTextFields(),
                    SizedBox(
                      height: 20,
                    ),
                    ForgetButton()
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
