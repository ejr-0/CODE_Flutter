import 'package:app/screen/components/button.dart';
import 'package:app/screen/components/drawer.dart';
import 'package:app/screen/components/textformfield.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _websiteURLController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyTextFormField(
              controller: _usernameController,
              label: const Text('User name'),
              obscureText: false,
              validator: (value) {
                return;
              },
              keyboardType: TextInputType.text,
            ),
            MyTextFormField(
              controller: _fullnameController,
              label: const Text('Full name'),
              obscureText: false,
              validator: (value) {
                return;
              },
              keyboardType: TextInputType.text,
            ),
            MyTextFormField(
              controller: _websiteURLController,
              label: const Text('Website URL'),
              obscureText: false,
              validator: (value) {
                return;
              },
              keyboardType: TextInputType.url,
            ),
            MyButton(
              onTap: () {},
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
