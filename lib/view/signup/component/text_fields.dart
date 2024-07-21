import 'package:flutter/material.dart';
import 'package:sportat/const/dimensions.dart';
import 'package:sportat/core/validator/validation.dart';
import 'package:sportat/translations/locale_keys.g.dart';
import 'package:sportat/view/signup/controller.dart';
import 'package:sportat/view/signup/widget/country_code.dart';
import 'package:sportat/widgets/custom_text.dart';
import 'package:sportat/widgets/input_form_field.dart';
import 'package:easy_localization/easy_localization.dart';

class SignupTextFields extends StatefulWidget {
  const SignupTextFields({Key? key}) : super(key: key);

  @override
  _SignupTextFieldsState createState() => _SignupTextFieldsState();
}

class _SignupTextFieldsState extends State<SignupTextFields> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = SignUpController.of(context);
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          CustomText(
            text: LocaleKeys.Welcome_sign_up.tr(),
            fontSize: 20,
            fontWeight: FontWeight.bold,
            alignment: getAlignment(context),
          ),
          const SizedBox(
            height: 20,
          ),
          InputFormField(
            hint: LocaleKeys.LogIn_email.tr(),
            controller: controller.email,
            validator: Validator.email,
          ),
          Row(
            children: [
              CountryCodeField(
                onChange: (value)=>controller.item=value,
              ),
              const SizedBox(
                width: 6.36,
              ),
              Expanded(
                flex: 3,
                child: InputFormField(
                  hint: LocaleKeys.SignUp_your_phone_number.tr(),
                  validator: (value) => Validator.phoneNumber(value!),
                  isNumber: true,
                  onSave: (v) => controller.phone = v,
                ),
              )
            ],
          ),
          Row(
            children: [
              CountryCodeField(
                onChange: (value)=>controller.relativeItem=value,
              ),
              const SizedBox(
                width: 6.36,
              ),
              Expanded(
                flex: 3,
                child: InputFormField(
                  hint: LocaleKeys.SignUp_relative.tr(),
                  controller: controller.relativePhone,
                  isNumber: true,
                ),
              )
            ],
          ),
          InputFormField(
            hint: LocaleKeys.SignUp_date_of_birth.tr(),
            controller: controller.dateOfBirth,
            suffixIcon: IconButton(
                icon: const Icon(
                  Icons.calendar_today,
                  color: Colors.grey,
                ),
                onPressed: controller.selectDate),
          ),
          InputFormField(
            hint: LocaleKeys.LogIn_password.tr(),
            secure: true,
            isNext: false,
            controller: controller.password,
            validator: Validator.password,
          ),
        ],
      ),
    );
  }
}
