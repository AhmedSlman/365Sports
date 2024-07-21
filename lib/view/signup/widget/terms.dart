import 'package:flutter/material.dart';
import 'package:sportat/const/dimensions.dart';
import 'package:sportat/translations/locale_keys.g.dart';
import 'package:sportat/widgets/custom_text.dart';
import 'package:easy_localization/easy_localization.dart';

class Terms extends StatefulWidget {
  const Terms({Key? key}) : super(key: key);

  @override
  _TermsState createState() => _TermsState();
}

class _TermsState extends State<Terms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              CustomText(
                text: LocaleKeys.SignUp_terms_and_privacy.tr(),
                fontWeight: FontWeight.bold,
                fontSize: 15,
                alignment: getAlignment(context),
              ),
              const SizedBox(
                height: 7,
              ),
               CustomText(
               text: LocaleKeys.SignUp_termsandconditions.tr(),
                alignment: getAlignment(context),
                 fontSize: 14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
