import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final Widget label;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;

  const MyTextFormField({
    super.key,
    required this.controller,
    required this.label,
    required this.obscureText,
    required this.validator,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 25,
        right: 25,
      ),
      child: TextFormField(
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          label: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        obscureText: obscureText,
      ),
    );
  }
}
