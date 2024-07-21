import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sportat/widgets/custom_text.dart';

class UploadWayContainer extends StatelessWidget {

  final String? image;

  final String? text;

  final String? text1;

  final VoidCallback? onTap;

  const UploadWayContainer(
      {Key? key, this.onTap, this.image, this.text, this.text1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 22),
        decoration: const BoxDecoration(
            color: Color(0xffF4EFD8),
            borderRadius: BorderRadius.all(Radius.circular(6))),
        child: Wrap(
          spacing: 10,
          crossAxisAlignment: WrapCrossAlignment.center,
          direction: Axis.vertical,
          children: [
            Image.asset(image!),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              direction: Axis.vertical,
              children: [
                CustomText(
                  text: text!,
                  fontSize: 10,
                ),
                CustomText(
                  text: text1!,
                  fontSize: 10,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
