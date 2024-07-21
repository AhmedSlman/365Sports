import 'package:flutter/material.dart';
import 'package:sportat/const/dimensions.dart';
import 'package:sportat/core/validator/validation.dart';
import 'package:sportat/translations/locale_keys.g.dart';
import 'package:sportat/view/resetPassword/controller.dart';
import 'package:sportat/widgets/custom_text.dart';
import 'package:sportat/widgets/input_form_field.dart';
import 'package:easy_localization/easy_localization.dart';


class ResetPasswordTextFields extends StatelessWidget {
  const ResetPasswordTextFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller=ResetPasswordController.of(context);
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
           CustomText(
            text: LocaleKeys.ResetPassword_reset_password.tr(),
            fontSize: 20,
            fontWeight: FontWeight.bold,
            alignment: getAlignment(context),
          ),
          const SizedBox(height: 20,),
          InputFormField(
            hint: LocaleKeys.ResetPassword_new_password.tr(),
            secure: true,
            validator: (value)=>Validator.password(value),
            controller: controller.newPassword,
          ),
          InputFormField(
            hint: LocaleKeys.ResetPassword_confirm_new_password.tr(),
            secure: true,
            isNext: false,
            validator: (value)=>Validator.confirmPassword(value, controller.newPassword.text),
            controller: controller.confirmNewPassword,
          ),
        ],
      ),
    );
  }
}
