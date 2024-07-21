import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportat/core/router/router.dart';
import 'package:sportat/translations/locale_keys.g.dart';
import 'package:sportat/view/settings/controller.dart';
import 'package:sportat/view/settings/states.dart';
import 'package:sportat/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sportat/widgets/loading_indicator.dart';

class SubmitButtons extends StatelessWidget {
  const SubmitButtons({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final controller = SettingsController.of(context);
    return Row(
      children: [
        BlocBuilder(
          bloc: controller,
          builder: (context, state) => state is EditSettingsLoading
              ? const LoadingIndicator()
              : Expanded(
                  child: CustomButton(
                    text: LocaleKeys.Settings_save_changes.tr(),
                    onPress: controller.updateProfile,
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
