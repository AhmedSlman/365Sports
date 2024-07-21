import 'package:flutter/material.dart';
import 'package:sportat/core/router/router.dart';
import 'package:sportat/view/welcome/view.dart';

import 'custom_text.dart';
import 'custom_text_button.dart';


showAlertDilog()async{
  await  showDialog(
    context: MagicRouter.currentContext,
    builder: (context) =>  AlertDialog(
      title:  CustomText(
        text: 'Login',
        color: Colors.red,
        fontSize: 16,
      ),
      content: CustomText(
        text:'You should log in to continue',
        fontSize: 14,
      ),
      actions: [
        CustomTextButton(
          text: 'Login',
          onPressed: ()=>MagicRouter.navigateTo(const WelcomeView()),
        )
      ],
    ),
  );
}