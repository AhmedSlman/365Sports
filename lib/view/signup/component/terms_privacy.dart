import 'package:flutter/material.dart';
import 'package:sportat/const/dimensions.dart';
import 'package:sportat/translations/locale_keys.g.dart';
import 'package:sportat/view/signup/controller.dart';
import 'package:sportat/view/signup/widget/terms.dart';
import 'package:sportat/widgets/custom_text.dart';
import 'package:sportat/widgets/custom_text_button.dart';
import 'package:easy_localization/easy_localization.dart';

class AgreeWith extends StatefulWidget {
  const AgreeWith({Key? key}) : super(key: key);

  @override
  _AgreeWithState createState() => _AgreeWithState();
}

class _AgreeWithState extends State<AgreeWith> {
  bool isAgree = false;

  @override
  Widget build(BuildContext context) {
    final controller=SignUpController.of(context);
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
          ),
          width: 19,
          height: 19,
          child: Theme(
            data: Theme.of(context).copyWith(
              unselectedWidgetColor: Colors.white,
            ),
            child: Checkbox(
              checkColor: Colors.black,
              activeColor: Colors.transparent,
              onChanged: (v) {
                setState(() {
                  controller.isCheck = v!;
                });
              },
              value: controller.isCheck,
              side: const BorderSide(color: Colors.black),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        CustomText(
          text: LocaleKeys.SignUp_agree_with.tr(),
          color: Colors.black,
          alignment: getAlignment(context),
          fontSize: 14,
        ),
        CustomTextButton(
          text: LocaleKeys.SignUp_terms_and_privacy.tr(),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => const FractionallySizedBox(
                heightFactor: 2,
                child: Terms(),
              ),
            );
          },
          color: Colors.black,
          fontWeight: FontWeight.bold,
        )
      ],
    );
  }
}
