import 'package:flutter/material.dart';
import 'package:sportat/const/colors.dart';
import 'package:sportat/translations/locale_keys.g.dart';
import 'package:sportat/widgets/custom_text.dart';
import 'package:easy_localization/easy_localization.dart';



class RulesView extends StatelessWidget {
  const RulesView({Key? key, this.rules}) : super(key: key);
  final String? rules;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: const IconThemeData(color: Colors.black,),
        centerTitle: true,
        title:  CustomText(
          text: LocaleKeys.competition_rules.tr(),
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          child:  CustomText(
            text:LocaleKeys.newrules.tr(),
            fontSize: 16,
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }
}
