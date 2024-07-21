import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportat/translations/locale_keys.g.dart';
import 'package:sportat/view/addVideo/controller.dart';
import 'package:sportat/view/addVideo/states.dart';
import 'package:sportat/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sportat/widgets/loading_indicator.dart';

class UploadButton extends StatelessWidget {
  const UploadButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = AddVideoController.of(context);
    return BlocBuilder(
      bloc: controller,
      builder:(BuildContext context,state)=> state is AddVideoLoading?LoadingIndicator():CustomButton(
        text: LocaleKeys.UploadVideo_upload.tr(),
        fontSize: 17,
        onPress: controller.addVideo,
      ),
    );
  }
}
