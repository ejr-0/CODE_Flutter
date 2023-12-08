import 'package:flutter/material.dart';
import 'package:simplelayout/screen/components/content_button.dart';
import 'package:simplelayout/screen/components/content_text.dart';
import 'package:simplelayout/screen/components/content_image.dart';
import 'package:simplelayout/screen/components/content_title.dart';

class SimpleLayout extends StatelessWidget {
  const SimpleLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageWidget(
              imageURL: 'images/elnido.jpg',
            ),
            TitleWidget(
              address: 'El Nido, Palawan',
              country: 'Philippines',
            ),
            BodyContentWidget(),
            TextWidget(),
          ],
        ),
      ),
    );
  }
}
