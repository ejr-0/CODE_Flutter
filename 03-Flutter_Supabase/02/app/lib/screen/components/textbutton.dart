import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  final Widget text;
  final Function()? onTap;
  final String label;

  const MyTextButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20,
      ),
      child: SizedBox(
        child: Column(
          children: [
            text,
            GestureDetector(
              onTap: onTap,
              child: Text(
                label,
                style: const TextStyle(color: Colors.blueAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
