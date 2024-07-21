import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportat/translations/locale_keys.g.dart';
import 'package:sportat/view/resetPassword/states.dart';
import 'package:sportat/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sportat/widgets/loading_indicator.dart';

import '../controller.dart';

class ResetPasswordButton extends StatelessWidget {
  const ResetPasswordButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = ResetPasswordController.of(context);
    return BlocBuilder(
      bloc: controller,
      builder: (context, state) => state is ResetPasswordLoading
          ? const LoadingIndicator()
          : CustomButton(
              text: LocaleKeys.ResetPassword_save.tr(),
              fontColor: Colors.white,
              onPress: controller.changePassword,
            ),
    );
  }
}
