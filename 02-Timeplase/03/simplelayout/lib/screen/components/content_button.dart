import 'package:flutter/material.dart';
import 'package:simplelayout/screen/components/button.dart';

class BodyContentWidget extends StatelessWidget {
  const BodyContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        left: 50,
        right: 50,
      ),
      child: Row(
        children: [
          ButtonWidget(
            buttonName: 'Map',
            icon: Icon(Icons.map),
            alertText: 'MAP',
          ),
          Spacer(),
          ButtonWidget(
            buttonName: 'Hotel',
            icon: Icon(Icons.home),
            alertText: 'HOTEL',
          ),
          Spacer(),
          ButtonWidget(
            buttonName: 'Share',
            icon: Icon(Icons.share),
            alertText: 'SHARE',
          ),
        ],
      ),
    );
  }
}
