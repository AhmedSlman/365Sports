import 'package:flutter/material.dart';
import 'package:sportat/translations/locale_keys.g.dart';
import 'package:sportat/view/addVideo/component/choose_sport.dart';
import 'package:sportat/view/addVideo/component/upload_vedio.dart';
import 'package:sportat/view/navBar/components/upload_video_fields.dart';
import 'package:sportat/widgets/custom_button.dart';
import 'package:sportat/widgets/custom_text.dart';
import 'package:easy_localization/easy_localization.dart';

void addVideoForm(BuildContext context) {
  showModalBottomSheet<void>(
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Form(
                  child: Wrap(
                    runSpacing: 20,
                    children: <Widget>[
                      CustomText(
                        text: LocaleKeys.UploadVideo_add_video.tr(),
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        alignment: Alignment.centerLeft,
                      ),
                      const UploadVideo(),
                      const UploadVideoFields(),
                      CustomText(
                        text: LocaleKeys.UploadVideo_choose_spoort.tr(),
                        fontSize: 16,
                      ),
                      const ChooseSport(),
                      CustomButton(
                        text: LocaleKeys.UploadVideo_upload.tr(),
                        fontSize: 17,
                      )
                    ],
                  ),
                ))),
      );
    },
  );
}
