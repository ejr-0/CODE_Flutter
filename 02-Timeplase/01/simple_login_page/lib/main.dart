import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Basic Widget',
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CustomTextFormField(
            paddingTop: 0,
            paddingBottom: 10,
            paddingLeft: 15,
            paddingRight: 15,
            obscureText: false,
            labelText: 'Username',
            icon: Icon(Icons.person),
          ),
          const CustomTextFormField(
            paddingTop: 0,
            paddingBottom: 50,
            paddingLeft: 15,
            paddingRight: 15,
            obscureText: true,
            labelText: 'Password',
            icon: Icon(Icons.key),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
              width: 200,
              height: 35,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                onPressed: () => {},
                child: const Text(
                  'Sign in',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () => {},
            child: const Text(
              'Create Account',
              style: TextStyle(
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          TextButton(
            onPressed: () => {},
            child: const Text(
              'Forget password',
              style: TextStyle(
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  final double paddingTop, paddingBottom, paddingLeft, paddingRight;
  final String labelText;
  final Icon icon;
  final bool obscureText;

  const CustomTextFormField({
    super.key,
    required this.paddingTop,
    required this.paddingBottom,
    required this.paddingLeft,
    required this.paddingRight,
    required this.labelText,
    required this.icon,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: paddingTop,
        bottom: paddingBottom,
        left: paddingLeft,
        right: paddingRight,
      ),
      child: TextFormField(
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: labelText,
          icon: icon,
        ),
      ),
    );
  }
}
