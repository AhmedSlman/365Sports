import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportat/translations/locale_keys.g.dart';
import 'package:sportat/view/changePassword/component/change_buttons.dart';
import 'package:sportat/view/changePassword/component/change_text_fields.dart';
import 'package:sportat/view/changePassword/controller.dart';
import 'package:sportat/widgets/custom_text.dart';
import 'package:easy_localization/easy_localization.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>ChangePasswordController(),
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Form(
            child: Wrap(
              runSpacing: 20,
              children: <Widget>[
                CustomText(
                  text: LocaleKeys.Settings_change_password.tr(),
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  alignment: context.locale == const Locale("en")
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                ),
                const ChangePasswordTextFiled(),
                const ChanePasswordButtons()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
