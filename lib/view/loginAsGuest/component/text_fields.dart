import 'package:flutter/material.dart';
import 'package:sportat/core/validator/validation.dart';
import 'package:sportat/translations/locale_keys.g.dart';
import 'package:sportat/view/loginAsGuest/controller.dart';
import 'package:sportat/widgets/custom_text.dart';
import 'package:sportat/widgets/input_form_field.dart';
import 'package:easy_localization/easy_localization.dart';


class GuestTextFields extends StatelessWidget {
  const GuestTextFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller=LoginAsGuestController.of(context);
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          Row(
            children:  [
              CustomText(
                text: LocaleKeys.LogIn_log_in.tr(),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              CustomText(
                text:' ${LocaleKeys.LogIn_as_a_guest.tr()}',
                fontSize: 14,
              ),
            ],
          ),
          const SizedBox(height: 20,),
          InputFormField(
            controller: controller.email,
            validator: (value)=>Validator.email(value),
            hint: LocaleKeys.LogIn_email.tr(),
            onPressed: (){},
          ),
        ],
      ),
    );
  }
}
