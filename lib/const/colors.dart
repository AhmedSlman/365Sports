import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

const Color primaryColor = Color.fromRGBO(238, 179, 18, 1); //yellow
const Color secColor = Color.fromRGBO(243, 181, 11, 1); //yellow light
const Color darkGrey = Color.fromRGBO(148, 148, 148, 1);
const Color lightGrey = Color.fromRGBO(238, 238, 238, 1);
const Color red = Color.fromRGBO(167, 9, 9, 1);

Shimmer shimmer({required Widget child}) => Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      enabled: true,
      child: child,
    );
