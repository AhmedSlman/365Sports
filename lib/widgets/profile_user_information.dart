import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sportat/translations/locale_keys.g.dart';
import 'package:sportat/view/profile/widgets/talent_numbers.dart';
import 'package:sportat/widgets/custom_text.dart';
import 'package:easy_localization/easy_localization.dart';

class UserInformation extends StatelessWidget {
  const UserInformation(
      {Key? key,
      this.isPageSettings,
      this.name,
      this.description,
      this.views,
      this.votes, this.onTap})
      : super(key: key);
  final bool? isPageSettings;
  final String? name;
  final String? description;
  final int? views;
  final int? votes;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              CustomText(
                text: name ?? '',
                fontWeight: FontWeight.bold,
                fontSize: 19,
              ),
              // const CustomText(
              //   text: "@mohamed20",
              //   fontSize: 16,
              //   verticalMargin: 10,
              // ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: '$description  ' ,
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    isPageSettings == true
                        ? TextSpan(
                            text: LocaleKeys.Settings_edit.tr(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                decoration: TextDecoration.underline),
                            recognizer: TapGestureRecognizer()
                              ..onTap = onTap)
                        : const TextSpan(text: ""),
                  ],
                ),
              )
            ],
          ),
        ),
        isPageSettings == true
            ? const Text("")
            : Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                color: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TalentNumbers(
                      title: LocaleKeys.VideoDetails_views.tr(),
                      number: views.toString(),
                    ),
                    TalentNumbers(
                      title: LocaleKeys.VideoDetails_votes.tr(),
                      number: votes.toString(),
                    ),
                  ],
                ),
              )
      ],
    );
  }
}
