import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportat/translations/locale_keys.g.dart';
import 'package:sportat/view/completeSignup/controller.dart';
import 'package:sportat/view/completeSignup/states.dart';
import 'package:sportat/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sportat/widgets/loading_indicator.dart';

class CompleteButton extends StatelessWidget {
  const CompleteButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = CompleteSignUpController.of(context);
    return BlocBuilder(
      bloc: controller,
      builder: (context, state) => state is CompleteSignupLoading
          ? const LoadingIndicator()
          : CustomButton(
              text: LocaleKeys.SignUp_next.tr(),
              fontColor: Colors.white,
              onPress: controller.completeSignUp,
            ),
    );
  }
}
