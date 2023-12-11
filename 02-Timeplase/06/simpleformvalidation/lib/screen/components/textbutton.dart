import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const MyTextButton({
    super.key,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 200,
      height: 45,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: GestureDetector(
        onTap: () {
          if (formKey.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Processing Data'),
              ),
            );
          }
        },
        child: const Text(
          'Submit',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
