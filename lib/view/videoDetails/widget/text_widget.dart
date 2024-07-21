import 'package:flutter/material.dart';
import 'package:sportat/const/colors.dart';
import 'package:sportat/widgets/custom_text.dart';


class TextWidget extends StatelessWidget {
  const TextWidget({Key? key, this.text='', this.number=''}) : super(key: key);
  final String text;
  final String number;

  @override
  Widget build(BuildContext context) {
    return Column(
      children:   [
        CustomText(
          text: text,
          color: secColor,
          fontSize: 14,
        ),
        CustomText(
          text: number,
          fontSize: 14,
        )
      ],
    );
  }
}
