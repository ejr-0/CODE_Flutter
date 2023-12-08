import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        ),
        title: const Text('AppBar'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: GestureDetector(
                    onTap: () {},
                    child: const Text('Setting'),
                  ),
                ),
                PopupMenuItem(
                  child: GestureDetector(
                    onTap: () {},
                    child: const Text('About'),
                  ),
                ),
              ];
            },
          )
        ],
      ),
    );
  }
}
