
import 'package:flutter/material.dart';



class FloatingActionChild extends StatelessWidget {
  const FloatingActionChild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      child: const Icon(
        Icons.add,
        color: Colors.black,
      ),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
       color: Color.fromRGBO(238, 209, 18, 1)
      ),
    );
  }
}
