import 'package:flutter/material.dart';
import 'package:sportat/core/router/router.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2),
            color: Colors.black),
        child: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 18,
            color: Colors.white,
          ),
          onPressed: () => MagicRouter.pop(),
          iconSize: 15,
        ),
      ),
    );
  }
}
