import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final TextDecoration? decoration;

  const CustomTextButton({
    Key? key,
    this.text = '',
    this.color,
    this.onPressed,
    this.alignment,
    this.fontWeight,
    this.fontSize, this.decoration,
  }) : super(key: key);
  final String text;
  final Color? color;
  final VoidCallback? onPressed;
  final Alignment? alignment;
  final FontWeight? fontWeight;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: TextButton(
        child: Text(
          text,
          style: TextStyle(
            decoration: decoration,
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
