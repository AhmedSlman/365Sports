import 'package:flutter/material.dart';
import 'package:sportat/const/dimensions.dart';
import 'package:sportat/widgets/custom_text.dart';

class SelectItemWidget extends StatefulWidget {
  const SelectItemWidget({Key? key, this.onTap, this.text = ''})
      : super(key: key);

  final VoidCallback? onTap;
  final String text;

  @override
  _SelectItemWidgetState createState() => _SelectItemWidgetState();
}

class _SelectItemWidgetState extends State<SelectItemWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
        if (widget.onTap != null) {
          widget.onTap!();
        }
      },
      child: Container(
        width: sizeFromWidth(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: isSelected
              ? Colors.black
              : const Color.fromRGBO(232, 232, 232, 1),
          border: Border.all(color: Colors.black),
        ),
        child: CustomText(
          text: widget.text,
          fontSize: 12,
          alignment: Alignment.center,
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
