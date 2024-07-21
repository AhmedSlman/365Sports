import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  const SocialButton(
      {Key? key, this.googleTap, this.faceBookTap, this.twitterTap})
      : super(key: key);
  final VoidCallback? googleTap;
  final VoidCallback? faceBookTap;
  final VoidCallback? twitterTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: googleTap,
          child: Image.asset('assets/images/google.png'),
        ),
        const SizedBox(
          width: 15,
        ),
        InkWell(
          onTap: faceBookTap,
          child: Image.asset('assets/images/facebook.png'),
        ),
        const SizedBox(
          width: 15,
        ),
        InkWell(
          onTap: twitterTap,
          child: Image.asset('assets/images/twitter.png'),
        ),
      ],
    );
  }
}
