import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportat/translations/locale_keys.g.dart';
import 'package:sportat/view/videoDetails/controller.dart';
import 'package:sportat/view/videoDetails/states.dart';
import 'package:sportat/widgets/custom_button.dart';
import 'package:sportat/widgets/input_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sportat/widgets/loading_indicator.dart';

class Comment extends StatelessWidget {
  const Comment({Key? key, this.id}) : super(key: key);
  final int? id;
  @override
  Widget build(BuildContext context) {
    final controller=VideoDetailsController.of(context);
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
      child: Row(
        children:  [
          Expanded(
            flex: 3,
            child: InputFormField(
              controller: controller.comment,
              hint: LocaleKeys.VideoDetails_write_a_comment.tr(),
              radius: 9,
              fillColor: const Color.fromRGBO(238, 238, 238, 1),
            ),
          ),
          const SizedBox(width: 10,),
          Expanded(
            flex: 1,
            child: BlocBuilder(
              bloc: controller,
              builder:(BuildContext context,state)=>state is AddingComment?const LoadingIndicator(): CustomButton(
                text: LocaleKeys.VideoDetails_send.tr(),
                verticalPadding: 5,
                fontSize: 16,
                fontColor: Colors.white,
                onPress: ()=>controller.addComment(id),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
