import 'package:flutter/material.dart';
import 'package:sportat/const/dimensions.dart';
import 'package:sportat/widgets/custom_text.dart';


class SelectItemWidget extends StatelessWidget {
  const SelectItemWidget({Key? key, this.onTap, this.text=''}) : super(key: key);
  final VoidCallback? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: sizeFromWidth(6),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: const Color.fromRGBO(232, 232, 232, 1),
            border: Border.all(color: Colors.black)),
        child:  CustomText(
          text: text,
          fontSize: 12,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
