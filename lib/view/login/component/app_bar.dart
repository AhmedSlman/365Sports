import 'package:flutter/material.dart';
import 'package:sportat/const/dimensions.dart';
import 'package:sportat/core/router/router.dart';

class LoginAppBar extends StatelessWidget {
  const LoginAppBar({Key? key}) : super(key: key);

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
          child: CircleAvatar(
            backgroundColor: Colors.black,
            radius: 15,
            child: Container(
              alignment: Alignment.center,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 18,
                ),
                onPressed: () => MagicRouter.pop(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
