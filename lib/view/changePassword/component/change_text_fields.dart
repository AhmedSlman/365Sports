import 'package:flutter/material.dart';
import 'package:sportat/const/colors.dart';
import 'package:sportat/core/validator/validation.dart';
import 'package:sportat/translations/locale_keys.g.dart';
import 'package:sportat/view/changePassword/controller.dart';
import 'package:sportat/widgets/input_form_field.dart';
import 'package:easy_localization/easy_localization.dart';


class ChangePasswordTextFiled extends StatelessWidget {
  const ChangePasswordTextFiled({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller=ChangePasswordController.of(context);
    return Form(
      key: controller.formKey,
      child: Wrap(
        children: [
          InputFormField(
            hint: LocaleKeys.ChangePassword_current_password.tr(),
            fillColor: lightGrey,
            secure: true,
             controller: controller.oldPassword,
             validator: Validator.password,
          ),
          InputFormField(
            hint: LocaleKeys.ChangePassword_new_password.tr(),
            fillColor: lightGrey,
            secure: true,
             controller: controller.newPassword,
            validator: Validator.password,
          ),
          InputFormField(
            hint: LocaleKeys.ChangePassword_confirm_new_password.tr(),
            fillColor: lightGrey,
            secure: true,
            controller:
             controller.confirmNewPassword,
             validator: (value) => Validator.confirmPassword(value,
                controller.newPassword.text),
          ),
        ],
      ),
    );
  }
}
