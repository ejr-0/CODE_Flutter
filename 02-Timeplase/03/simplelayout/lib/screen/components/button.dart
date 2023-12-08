import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String buttonName;
  final Icon icon;
  final String alertText;

  const ButtonWidget({
    super.key,
    required this.buttonName,
    required this.icon,
    required this.alertText,
  });

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(alertText),
          actions: [
            TextButton(
              child: const Text('Done'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showMyDialog(context),
      child: Container(
        width: 60,
        height: 60,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.center,
            colors: [
              Colors.cyanAccent,
              Colors.white38,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            Text(buttonName),
          ],
        ),
      ),
    );
  }
}
