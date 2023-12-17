import 'package:flutter/material.dart';

class SpacerWithLine extends StatelessWidget {
  const SpacerWithLine({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(
        top: 75,
        bottom: 20,
      ),
      child: Container(
      width: size.width,
      height: 1,
      decoration: const BoxDecoration(
      color: Colors.grey,
      ),
    ));
  }
}