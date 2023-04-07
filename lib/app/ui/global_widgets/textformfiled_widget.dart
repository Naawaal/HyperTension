import 'package:flutter/material.dart';

class TextFormFieldWidegt extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final void Function(String)? onChanged;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final TextEditingController? controller;

  const TextFormFieldWidegt({
    super.key,
    this.hintText,
    this.controller,
    required this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autocorrect: true,
      enableSuggestions: true,
      onChanged: onChanged,
      textInputAction: labelText == 'Name' ||
              labelText == 'Age' ||
              labelText == 'Weight' ||
              labelText == 'Height' ||
              hintText == 'Blood Pressure' ||
              hintText == 'Plus Rate'
          ? TextInputAction.next
          : TextInputAction.done,
      keyboardType: hintText == 'Mobile Number' ||
              labelText == 'Age' ||
              labelText == 'Weight' ||
              labelText == 'Height' ||
              hintText == 'Blood Pressure' ||
              hintText == 'Plus Rate'
          ? TextInputType.phone
          : TextInputType.text,
      decoration: InputDecoration(
        isDense: true,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        hintText: hintText,
        prefixIcon: Icon(prefixIcon),
        suffixIcon: Icon(
          suffixIcon,
          color: Colors.green,
          size: 20,
        ),
        errorStyle: const TextStyle(
          color: Colors.red,
          fontSize: 15,
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(color: Colors.red),
        ),
        labelText: labelText,
      ),
    );
  }
}
