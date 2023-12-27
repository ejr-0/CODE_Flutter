import 'package:app/utils/constant.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final TextEditingController controller;

  const MyDrawer({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 225,
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.person,
                  size: 50,
                ),
                TextFormField(
                  controller: controller,
                  readOnly: true,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                '/home',
                (route) => false,
              );
            },
            child: const ListTile(
              title: Text('Home'),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                '/profile',
                (route) => false,
              );
            },
            child: const ListTile(
              title: Text('Profile'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: GestureDetector(
              onTap: () {
                client.auth.signOut();
                Navigator.of(context).pushNamedAndRemoveUntil(
                  '/',
                  (route) => false,
                );
              },
              child: const ListTile(
                title: Text('Log out'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
