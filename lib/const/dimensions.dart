import 'package:flutter/material.dart';
import 'package:sportat/core/router/router.dart';
import 'package:easy_localization/easy_localization.dart';
double sizeFromHeight(double fraction, {bool removeAppBarSize = true}) {
  MediaQueryData mediaQuery = MediaQuery.of(MagicRouter.currentContext);
  fraction = (removeAppBarSize
      ? (mediaQuery.size.height -
      AppBar().preferredSize.height -
      mediaQuery.padding.top)
      : mediaQuery.size.height) /
      (fraction == 0 ? 1 : fraction);
  return fraction;
}


double sizeFromWidth(double fraction) {
  fraction = MediaQuery
      .of(MagicRouter.currentContext)
      .size
      .width /
      (fraction == 0 ? 1 : fraction);
  return fraction;
}
bool isEn(BuildContext context) => context.locale == const Locale('en');

Alignment getAlignment(BuildContext context) =>
    isEn(context) ? Alignment.topLeft : Alignment.topRight;

const profileCoverRadius=BorderRadius.only(
    bottomLeft: Radius.circular(7),
    bottomRight: Radius.circular(7));

const screenPadding=EdgeInsets.symmetric(horizontal: 20);