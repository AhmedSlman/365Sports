import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sportat/const/colors.dart';
import 'package:sportat/const/dimensions.dart';
import '../core/router/router.dart';

showSnackBar(String message,
    {bool upperSnackBar = false,
    bool popPage = false,
    duration = 5,
    Color color = primaryColor}) {
  ScaffoldMessenger.of(MagicRouter.currentContext).hideCurrentSnackBar();
  ScaffoldMessenger.of(MagicRouter.currentContext).showSnackBar(
    SnackBar
      (

      backgroundColor: color,
      behavior: SnackBarBehavior.floating,
      margin: upperSnackBar ? EdgeInsets.only(bottom: sizeFromHeight(3)) : null,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      action: SnackBarAction(
        label: '',
        onPressed: () {},
      ),
      duration: Duration(seconds: duration),
    ),
  );
  if (popPage) Timer(const Duration(seconds: 5), () => MagicRouter.pop());
}
