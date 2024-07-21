import 'package:flutter/material.dart';
import 'package:sportat/core/validator/validation.dart';
import 'package:sportat/translations/locale_keys.g.dart';
import 'package:sportat/view/login/controller.dart';
import 'package:sportat/widgets/custom_text.dart';
import 'package:sportat/widgets/input_form_field.dart';
import 'package:easy_localization/easy_localization.dart';

class LoginTextFields extends StatelessWidget {
  const LoginTextFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = LoginController.of(context);
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          Row(
            children: [
              CustomText(
                text: LocaleKeys.LogIn_log_in.tr(),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              CustomText(
                text: ' ${LocaleKeys.LogIn_as_a_talent.tr()}',
                fontSize: 14,
              ),
            ],
          ),
          InputFormField(
            hint: LocaleKeys.SignUp_your_phone_number.tr(),
            validator: (v) => Validator.phoneNumber(v!),
            controller: controller.phone,
          ),
          InputFormField(
            hint: LocaleKeys.LogIn_password.tr(),
            validator: Validator.password,
            secure: true,
            isNext: false,
            controller: controller.password,
          ),
          // InputFormField(
          //   hint: 'token',
          //   controller: controller.token,
          // ),
        ],
      ),
    );
  }
}
