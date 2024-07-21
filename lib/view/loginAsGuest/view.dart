import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportat/const/colors.dart';
import 'package:sportat/core/router/router.dart';
import 'package:sportat/view/loginAsGuest/component/buttons.dart';
import 'package:sportat/view/loginAsGuest/component/text_fields.dart';
import 'package:sportat/view/loginAsGuest/controller.dart';
import 'package:sportat/view/signup/component/terms_privacy.dart';
import 'package:sportat/view/welcome/view.dart';
import 'package:sportat/widgets/custom_app_bar.dart';

class LoginGuestView extends StatelessWidget {
  const LoginGuestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginAsGuestController(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                primaryColor,
                secColor,
              ]),
            ),
            child: ListView(
              children: [
                CustomAppBar(
                    onPressed: () =>
                        MagicRouter.navigateTo(const WelcomeView())),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: const Column(
                    children: [
                      GuestTextFields(),
                      SizedBox(
                        height: 20,
                      ),
                      GuestButton(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
