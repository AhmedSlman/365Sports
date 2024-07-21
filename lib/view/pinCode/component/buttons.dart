import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportat/const/dimensions.dart';
import 'package:sportat/translations/locale_keys.g.dart';
import 'package:sportat/view/pinCode/controller.dart';
import 'package:sportat/view/pinCode/states.dart';
import 'package:sportat/widgets/custom_button.dart';
import 'package:sportat/widgets/custom_text_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sportat/widgets/loading_indicator.dart';

class PinCodeButtons extends StatelessWidget {
  const PinCodeButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = PinCodeController.of(context);
    return Column(
      children: [
        BlocBuilder(
          bloc: controller,
          builder: (context,state)=> CustomTextButton(
            text: LocaleKeys.PinCode_resend.tr(),
            fontSize: 12,
            color: Colors.black,
            alignment: getAlignment(context),
            onPressed: controller.resendCode,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        BlocBuilder(
          bloc: controller,
          builder: (context, state) => state is PinCodeLoading
              ? const LoadingIndicator()
              : CustomButton(
                  text: LocaleKeys.SignUp_next.tr(),
                  fontSize: 15,
                  fontColor: Colors.white,
                  onPress: controller.checkPinCode
                ),
        ),
      ],
    );
  }
}
