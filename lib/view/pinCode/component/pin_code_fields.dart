import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sportat/const/colors.dart';
import 'package:sportat/core/validator/validation.dart';
import 'package:sportat/view/pinCode/controller.dart';

class PinCodeFields extends StatelessWidget {
  const PinCodeFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = PinCodeController.of(context);
    return PinCodeTextField(
      pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 40,
          fieldWidth: 42,
          activeColor: Colors.white,
          inactiveColor: Colors.white,
          selectedColor: primaryColor,
          activeFillColor: const Color.fromRGBO(248, 239, 194, 1),
          inactiveFillColor: const Color.fromRGBO(248, 239, 194, 1),
          selectedFillColor: const Color.fromRGBO(248, 239, 194, 1)),
      enableActiveFill: true,
      keyboardType: TextInputType.number,
      cursorColor: primaryColor,
      appContext: context,
      length: 6,
      controller: controller.code,
      validator: (v) => Validator.pinCode(v!),
      onChanged: (String value) => controller.code,
    );
  }
}
