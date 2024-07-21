import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sportat/const/colors.dart';
import 'package:sportat/core/validator/validation.dart';
import 'package:sportat/translations/locale_keys.g.dart';
import 'package:sportat/widgets/code_field.dart';
import 'package:sportat/widgets/input_form_field.dart';
import 'package:easy_localization/easy_localization.dart';

import '../controller.dart';

class UploadVideoFields extends StatelessWidget {
  const UploadVideoFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = AddVideoController.of(context);
    return Form(
      key: controller.formKey,
      child: Wrap(
        children: [
          InputFormField(
            validator: (value) => Validator.name(value!),
            controller: controller.title,
            hint: LocaleKeys.UploadVideo_title.tr(),
            fillColor: lightGrey,
          ),
          InputFormField(
            validator: (value) => Validator.name(value!),
            controller: controller.tags,
            hint: LocaleKeys.UploadVideo_tags.tr(),
            fillColor: lightGrey,
          ),
          CodeField(
            text: LocaleKeys.UploadVideo_add_description.tr(),
            items:  [
              LocaleKeys.UploadVideo_goalkeeper.tr(),
              LocaleKeys.UploadVideo_rightback.tr(),
              LocaleKeys.UploadVideo_leftback.tr(),
              LocaleKeys.UploadVideo_centerback.tr(),
              LocaleKeys.UploadVideo_defender.tr(),
              LocaleKeys.UploadVideo_wingleft.tr(),
              LocaleKeys.UploadVideo_wingright.tr(),
              LocaleKeys.UploadVideo_playmaker.tr(),
              LocaleKeys.UploadVideo_attacker.tr(),
              LocaleKeys.UploadVideo_technicalmanager.tr(),
              LocaleKeys.UploadVideo_coach.tr(),
              LocaleKeys.UploadVideo_assistantcoach.tr(),
              LocaleKeys.UploadVideo_sportsannouncer.tr(),
            ],
            onSave: (v)=>controller.description=v,
            validator: (v)=>Validator.name(v!),
          ),
        ],
      ),
    );
  }
}
