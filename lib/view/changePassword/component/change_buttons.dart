



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportat/core/router/router.dart';
import 'package:sportat/translations/locale_keys.g.dart';
import 'package:sportat/view/changePassword/controller.dart';
import 'package:sportat/view/changePassword/states.dart';
import 'package:sportat/widgets/custom_button.dart';
import 'package:sportat/widgets/loading_indicator.dart';
import 'package:easy_localization/easy_localization.dart';

class ChanePasswordButtons extends StatelessWidget {
  const ChanePasswordButtons({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final controller =ChangePasswordController.of(context);
    return Row(
      children: [
        BlocBuilder(
          bloc: controller,
          builder: (context, state) => state is ChangePasswordLoading
              ? const LoadingIndicator()
              : Expanded(
            child: CustomButton(
              text: LocaleKeys.Settings_save_changes.tr(),
              onPress: controller.changePassword,
            ),
          ),
        ),
        const SizedBox(
          width: 25,
        ),
        Expanded(
            child: CustomButton(
              text: LocaleKeys.Settings_cancel.tr(),
              fontColor: Colors.black,
              buttonColor: Colors.white,
              borderColor: Colors.black,
              onPress: () => MagicRouter.pop(),
            ))
      ],
    );
  }
}
