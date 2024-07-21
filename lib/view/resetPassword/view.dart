import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportat/const/colors.dart';
import 'package:sportat/core/router/router.dart';
import 'package:sportat/view/ForgetPassword/view.dart';
import 'package:sportat/view/resetPassword/component/text_fields.dart';
import 'package:sportat/view/resetPassword/controller.dart';
import 'package:sportat/widgets/custom_app_bar.dart';

import 'component/buttons.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({Key? key, this.code, this.phone}) : super(key: key);
  final TextEditingController? code;
  final String? phone;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ResetPasswordController(phone!, code!),
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
            child: Column(
              children: [
                CustomAppBar(
                  onPressed: () =>
                      MagicRouter.navigateTo(const ForgetPasswordView()),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: const [
                      ResetPasswordTextFields(),
                      SizedBox(
                        height: 20,
                      ),
                      ResetPasswordButton()
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
