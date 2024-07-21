import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    this.icon,
    this.onPressed,
    this.color,
  }) : super(key: key);
  final IconData? icon;
  final VoidCallback? onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon,color: color,),
      onPressed: onPressed,
    );
  }
}
