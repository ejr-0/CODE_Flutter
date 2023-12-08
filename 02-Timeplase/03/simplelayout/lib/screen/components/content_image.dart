import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String imageURL;
  const ImageWidget({
    super.key,
    required this.imageURL,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Image.asset(
      imageURL,
      width: size.width,
      height: size.height * 0.4,
      fit: BoxFit.fill,
    );
  }
}
