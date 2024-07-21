import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    this.text='',
    this.fontSize=20,
    this.color=Colors.black,
     this.alignment,
    this.fontWeight,
    this.verticalMargin = 0,
    this.textAlign, this.decoration, this.fontFamily
  }) : super(key: key);

  final String? text;
  final double fontSize;
  final String? fontFamily;
  final Color color;
  final Alignment? alignment;
  final FontWeight? fontWeight;
  final double verticalMargin;
  final TextAlign? textAlign;
  final TextDecoration? decoration;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: verticalMargin),
      alignment: alignment,
      child: Text(

        text!,
        style: TextStyle(
          decoration: decoration,
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight,
        ),
        textAlign: textAlign,

      ),
    );
  }
}
