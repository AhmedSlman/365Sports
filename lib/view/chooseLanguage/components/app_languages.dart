import 'package:flutter/material.dart';
import 'package:sportat/widgets/custom_text.dart';
import 'package:easy_localization/easy_localization.dart';

enum _Languages { en, ar ,fn}

class AppLanguage extends StatefulWidget {
  const AppLanguage({Key? key}) : super(key: key);

  @override
  State<AppLanguage> createState() => _AppLanguageState();
}

class _AppLanguageState extends State<AppLanguage> {
  _Languages selectedLanguage = _Languages.en;
  @override
  void didChangeDependencies() {
    if (context.locale == const Locale('ar')) {
      setState(() {
      selectedLanguage = _Languages.ar;
    });
    }
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile(
          activeColor: Colors.black,
          contentPadding: EdgeInsets.zero,
          title: const CustomText(
            text: 'English',
            fontSize: 15,
          ),
          value: selectedLanguage,
          groupValue: _Languages.en,
          onChanged: (v) {
            setState(() {
              selectedLanguage = _Languages.en;
              context.setLocale(const Locale('en'));
            });
          },
        ),
        RadioListTile(
          activeColor: Colors.black,
          contentPadding: EdgeInsets.zero,
          title: const CustomText(
            text: 'العربية',
            fontSize: 15,
          ),
          value: selectedLanguage,
          groupValue: _Languages.ar,
          onChanged: (v) {
            setState(() {
              selectedLanguage = _Languages.ar;
              context.setLocale(const Locale('ar'));
            });
          },
        ),
        RadioListTile(
          activeColor: Colors.black,
          contentPadding: EdgeInsets.zero,
          title: const CustomText(
            text: 'French',
            fontSize: 15,
          ),
          value: selectedLanguage,
          groupValue: _Languages.fn,
          onChanged: (v) {
            setState(() {
              selectedLanguage = _Languages.fn;
            });
          },
        )
      ],
    );
  }
}
