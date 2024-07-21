import 'package:flutter/material.dart';
import 'package:sportat/widgets/custom_text.dart';

class TalentNumbers extends StatelessWidget {
  final String? title;

  final String? number;

  const TalentNumbers({Key? key, this.title, this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        CustomText(
          text: number!,
          fontSize: 19,
          fontWeight: FontWeight.bold,
        ),
        CustomText(
          verticalMargin: 5,
          text: title!,
          fontSize: 14,
        )
      ],
    );
  }
}
