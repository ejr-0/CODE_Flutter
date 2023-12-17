import 'package:app/utils/constant.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          client.auth.signOut();
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/',
            (route) => false,
          );
        },
        child: const Text('Log out'),
      ),
    );
  }
}