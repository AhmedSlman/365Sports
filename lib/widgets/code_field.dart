import 'package:flutter/material.dart';

class CodeField extends StatefulWidget {
  const CodeField(
      {Key? key,
      this.items,
      this.text = '',
      this.fillColor = const Color.fromRGBO(248, 239, 194, 1),
      this.onSave,
      this.validator})
      : super(key: key);
  final List<String>? items;
  final String text;
  final Color? fillColor;
  final Function(String?)? onSave;
  final String? Function(String?)? validator;

  @override
  _CodeFieldState createState() => _CodeFieldState();
}

class _CodeFieldState extends State<CodeField> {
  String? _chosenValue;

  // List<String>? categories = widget.items;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: widget.fillColor!,
      ),
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: DropdownButtonFormField(
        iconEnabledColor: const Color.fromRGBO(148, 148, 148, 1),
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        value: _chosenValue,
        items: widget.items?.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem(
            value: value,
            child: Text(
              value,
              style: const TextStyle(color: Colors.black, fontSize: 12),
            ),
          );
        }).toList(),
        hint: Text(
          widget.text,
          style: const TextStyle(color: Colors.grey, fontSize: 14),
        ),
        onChanged: (String? value) {
          setState(() {
            _chosenValue = value;





          });
          _chosenValue=value;
        },
        onSaved: widget.onSave,
        validator: widget.validator,
      ),
    );
  }
}
