import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:sportat/widgets/input_form_field.dart';


class CountryPickerCard extends StatelessWidget {
  const CountryPickerCard({Key? key, this.controller, this.hint, this.onChange, this.onSelected}) : super(key: key);
 final TextEditingController? controller;
  final String? hint;
  final Function(String?)? onChange;
  final void Function(Country country)? onSelected;

  @override
  Widget build(BuildContext context) {
    return InputFormField(
      controller: controller,
      hint: hint!,
      onChanged: onChange,
      suffixIcon: IconButton(icon: const Icon(Icons.arrow_drop_down),onPressed: (){ showCountryPicker(
        context: context,
        countryListTheme: CountryListThemeData(
          flagSize: 25,
          backgroundColor: Colors.white,
          textStyle: const TextStyle(fontSize: 16, color: Colors.blueGrey),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          //Optional. Styles the search field.
          inputDecoration: InputDecoration(
            labelText: 'Search',
            hintText: 'Start typing to search',
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: const Color(0xFF8C98A8).withOpacity(0.2),
              ),
            ),
          ),
        ),
        onSelect: onSelected!,
      );},),
    );
  }
}
