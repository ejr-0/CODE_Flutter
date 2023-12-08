import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String address;
  final String country;
  const TitleWidget({
    super.key,
    required this.address,
    required this.country,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 10,
        left: 30,
        right: 30,
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                address,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.lightBlue,
                ),
              ),
              Text(
                country,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.blueGrey,
                ),
              ),
            ],
          ),
          const Spacer(),
          const LikeWidget(),
        ],
      ),
    );
  }
}

class LikeWidget extends StatefulWidget {
  const LikeWidget({super.key});

  @override
  State<LikeWidget> createState() => _LikeWidgetState();
}

class _LikeWidgetState extends State<LikeWidget> {
  bool _isLike = false;
  int _likeCount = 50;

  void _toggleLike() {
    setState(() {
      if (_isLike) {
        _likeCount -= 1;
        _isLike = false;
      } else {
        _likeCount += 1;
        _isLike = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            onPressed: _toggleLike,
            icon: (_isLike
                ? const Icon(Icons.star)
                : const Icon(Icons.star_border)),
          ),
        ),
        Text('$_likeCount'),
      ],
    );
  }
}
