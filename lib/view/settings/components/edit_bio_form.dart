import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportat/const/colors.dart';
import 'package:sportat/const/dimensions.dart';
import 'package:sportat/core/validator/validation.dart';
import 'package:sportat/translations/locale_keys.g.dart';
import 'package:sportat/view/settings/controller.dart';
import 'package:sportat/view/settings/states.dart';
import 'package:sportat/widgets/custom_button.dart';
import 'package:sportat/widgets/custom_text.dart';
import 'package:sportat/widgets/input_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sportat/widgets/loading_indicator.dart';

void showEditBioForm(BuildContext context) {
  final controller = SettingsController.of(context);
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Form(
                child: Wrap(
                  runSpacing: 20,
                  children: <Widget>[
                    CustomText(
                      text: LocaleKeys.EditBio_edit_bio.tr(),
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      alignment: getAlignment(context),
                    ),
                    InputFormField(
                      hint: "Bio",
                      fillColor: lightGrey,
                      multiLine: true,
                      maxLines: 3,
                      controller: controller.bio,
                      validator: (va) => Validator.name(va!),
                    ),
                    BlocBuilder(
                      bloc: controller,
                      builder: (context, state) => state is SettingsLoading
                          ? const LoadingIndicator()
                          : CustomButton(
                              text: LocaleKeys.Settings_save_changes.tr(),
                              onPress: controller.updateProfile,
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ));
}
