import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum SocialMedia { facebook, twitter, linkedln}

Widget buildSocialButton({required IconData icon, Color? color, required Function() onClicked})
=> InkWell(
  child: Container(
    width : 60,
    height : 60,
    child:  Center(
        child: FaIcon(icon, color:color,size: 40)
    ),
  ),
  onTap: onClicked,
);