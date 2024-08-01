import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportat/const/colors.dart';
import 'package:sportat/core/router/router.dart';
import 'package:sportat/view/loginAsGuest/view.dart';
import 'package:sportat/view/pinCode/component/app_bar.dart';
import 'package:sportat/view/pinCode/component/buttons.dart';
import 'package:sportat/view/pinCode/component/pin_code_fields.dart';
import 'package:sportat/view/pinCode/controller.dart';
import 'package:sportat/view/signup/view.dart';
import 'package:sportat/widgets/custom_app_bar.dart';

class PinCodeView extends StatelessWidget {
  const PinCodeView(
      {Key? key,
      this.phone='',
      this.isForget=false,
      this.email='',
      this.isGuest=false,
      this.isCheck=false,
      this.item=''})
      : super(key: key);
  final String? email;
  final String? phone;
  final String? item;
  final bool? isForget;
  final bool? isGuest;
  final bool? isCheck;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PinCodeController(email, phone, isForget!, isGuest!, isCheck, item),
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                primaryColor,
                secColor,
              ],
            ),
          ),
          child: ListView(
            children: [
              CustomAppBar(
                onPressed: () => MagicRouter.navigateTo(isGuest == true
                    ? const LoginGuestView()
                    : const SignupView()),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: const Column(
                  children: [
                    PinCodeAppBar(),
                    SizedBox(
                      height: 22,
                    ),
                    PinCodeFields(),
                    PinCodeButtons()
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
