import 'package:flutter/material.dart';
import 'package:sportat/const/dimensions.dart';
import 'package:sportat/core/validator/validation.dart';
import 'package:sportat/translations/locale_keys.g.dart';
import 'package:sportat/view/ForgetPassword/controller.dart';
import 'package:sportat/widgets/custom_text.dart';
import 'package:sportat/widgets/input_form_field.dart';
import 'package:easy_localization/easy_localization.dart';


class ForgetTextFields extends StatelessWidget {
  const ForgetTextFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller=ForgetPasswordController.of(context);
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
           CustomText(
            text: LocaleKeys.ForgetPassword_forget_your_password.tr(),
            fontSize: 20,
            fontWeight: FontWeight.bold,
            alignment: getAlignment(context),
          ),
           CustomText(
            text: LocaleKeys.ForgetPassword_please_enter_your_phone_number.tr(),
            fontSize: 14,
            alignment: getAlignment(context),

          ),
          const SizedBox(height: 20,),
          InputFormField(
            hint: LocaleKeys.SignUp_your_phone_number.tr(),
            validator: (v)=>Validator.phoneNumber(v!),
            isNext: false,
            
            onSave: (v)=>controller.phone=v,
          ),
        ],
      ),
    );
  }
}
