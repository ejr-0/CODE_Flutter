import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextFormField extends StatelessWidget {
  final Widget label;
  final String validateLabel;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  const MyTextFormField({
    super.key,
    required this.label,
    required this.validateLabel,
    required this.keyboardType,
    required this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 5,
        right: 5,
        bottom: 20,
      ),
      child: TextFormField(
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your $validateLabel!';
          }
          return null;
        },
        decoration: InputDecoration(
          label: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
