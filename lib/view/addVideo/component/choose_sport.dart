import 'package:flutter/material.dart';
import 'package:sportat/const/colors.dart';
import 'package:sportat/view/addVideo/controller.dart';
import 'package:sportat/view/home/controller.dart';
import 'package:sportat/widgets/custom_text.dart';

class ChooseSport extends StatefulWidget {
  const ChooseSport({Key? key}) : super(key: key);

  @override
  State<ChooseSport> createState() => _ChooseSportState();
}

class _ChooseSportState extends State<ChooseSport> {
  int? value;

  @override
  Widget build(BuildContext context) {
    final controller = AddVideoController.of(context);
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 1 / .4),
      padding: const EdgeInsets.symmetric(vertical: 10),
      itemCount: categories!.length,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemBuilder: (BuildContext context, int index) => Row(
        children: [
          Radio(
            fillColor: MaterialStateProperty.all(secColor),
            groupValue: value,
            value: index,
            onChanged: (val) {
              setState(() => value = val as int?);
              controller.id = categories![index]['id'];
            },
          ),
          CustomText(
            text: categories![index]['name'],
            fontSize: 14,
          )
        ],
      ),
    );
  }
}
