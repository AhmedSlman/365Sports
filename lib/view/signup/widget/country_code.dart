import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';


class CountryCodeField extends StatelessWidget {
  const CountryCodeField({Key? key, this.onChange, }) : super(key: key);

final Function(CountryCode)? onChange;
  @override
  Widget build(BuildContext context) {
    return  Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: const Color.fromRGBO(248, 239, 194, 1),
        ),
        child: CountryCodePicker(
          padding: EdgeInsets.zero,
          onChanged: onChange,
          initialSelection: 'US',
          favorite: const ['+966', 'العربية السعودية'],
          showCountryOnly: false,
          showOnlyCountryWhenClosed: false,
          alignLeft: false,
        ),
      ),
    );
  }
}
