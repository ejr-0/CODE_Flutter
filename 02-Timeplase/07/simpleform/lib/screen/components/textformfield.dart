import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextFormField extends StatelessWidget {
  final String label;
  final String validateLabel;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final bool obscureText;

  const MyTextFormField({
    super.key,
    required this.label,
    required this.validateLabel,
    required this.keyboardType,
    required this.inputFormatters,
    required this.controller,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 15,
        left: 25,
        right: 25,
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Enter your $validateLabel!';
          }
          return null;
        },
        decoration: InputDecoration(
          label: Text(label),
        ),
        obscureText: obscureText,
      ),
    );
  }
}
