import 'package:flutter/material.dart';
import 'package:sportat/const/dimensions.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, this.onPressed}) : super(key: key);

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/login.png',
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Container(
          height: sizeFromHeight(3),
          margin: const EdgeInsets.symmetric(horizontal: 30),
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
              onPressed: onPressed,
              iconSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}
