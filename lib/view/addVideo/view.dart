import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportat/const/dimensions.dart';
import 'package:sportat/translations/locale_keys.g.dart';
import 'package:sportat/view/addVideo/component/upload_button.dart';
import 'package:sportat/view/addVideo/component/upload_vedio.dart';
import 'package:sportat/view/addVideo/component/upload_video_fields.dart';
import 'package:sportat/view/addVideo/controller.dart';
import 'package:sportat/view/addVideo/states.dart';
import 'package:sportat/widgets/custom_text.dart';
import 'package:easy_localization/easy_localization.dart';

void addVideoForm(BuildContext context) {
  showModalBottomSheet<void>(
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return BlocProvider(
        create: (BuildContext context) => AddVideoController(),
        child: Container(
          height: sizeFromHeight(1.25),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: SingleChildScrollView(
            padding: MediaQuery.of(context).viewInsets,
            child: Form(
              child: Wrap(
                runSpacing: 20,
                children: <Widget>[
                  CustomText(
                    text: LocaleKeys.UploadVideo_add_video.tr(),
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    alignment: getAlignment(context),
                  ),
                  const UploadVideo(),
                  BlocBuilder<AddVideoController, AddVideoStates>(
                    builder: (BuildContext context, state) => CustomText(
                      text: AddVideoController.of(context).error,
                      fontSize: 15,
                      color: Colors.red,
                    ),
                  ),
                  const UploadVideoFields(),
                  // CustomText(
                  //   text: LocaleKeys.UploadVideo_choose_spoort.tr(),
                  //   fontSize: 16,
                  // ),
                  // const ChooseSport(),
                  const UploadButton()
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
