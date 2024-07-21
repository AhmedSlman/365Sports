import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sportat/const/colors.dart';
import 'package:sportat/translations/locale_keys.g.dart';
import 'package:sportat/widgets/input_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
class UploadVideoFields extends StatelessWidget {
  const UploadVideoFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(

      children:  [
        InputFormField(hint:LocaleKeys.UploadVideo_title.tr(),fillColor: lightGrey,),
        InputFormField(hint: LocaleKeys.UploadVideo_add_description.tr(),fillColor: lightGrey,maxLines: 4,multiLine: true,),
        InputFormField(hint: LocaleKeys.UploadVideo_tags.tr(),fillColor: lightGrey,),
      ],
    );
  }
}
