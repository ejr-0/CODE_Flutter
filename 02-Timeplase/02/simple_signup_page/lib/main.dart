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
      title: 'Simple Sign-up Page',
      home: SignUpPage(),
    );
  }
}

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Registration'),
        leading: IconButton(
          onPressed: () => {},
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.grey,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Username
          const CustomTextFormField(
            paddingTop: 0,
            paddingBottom: 10,
            paddingLeft: 15,
            paddingRight: 15,
            labelText: 'Username',
            icon: Icon(Icons.person),
            obscureText: false,
          ),
          //Email
          const CustomTextFormField(
            paddingTop: 0,
            paddingBottom: 10,
            paddingLeft: 15,
            paddingRight: 15,
            labelText: 'Email Address',
            icon: Icon(Icons.email),
            obscureText: false,
          ),
          //Password
          const CustomTextFormField(
            paddingTop: 0,
            paddingBottom: 10,
            paddingLeft: 15,
            paddingRight: 15,
            labelText: 'Password',
            icon: Icon(Icons.key),
            obscureText: true,
          ),
          //Confirm Password
          const CustomTextFormField(
            paddingTop: 0,
            paddingBottom: 50,
            paddingLeft: 15,
            paddingRight: 15,
            labelText: 'Confirm Password',
            icon: Icon(Icons.key),
            obscureText: true,
          ),
          //Sign Up Button
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
              width: 200,
              height: 35,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextButton(
                onPressed: () => {},
                child: const Text(
                  'Sign up',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
              bottom: 10,
            ),
            child: Container(
              width: 300,
              height: 2.0,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(1.0),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () => {},
                  color: Colors.grey,
                  icon: const Icon(Icons.eco),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () => {},
                  color: Colors.grey,
                  icon: const Icon(Icons.facebook),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () => {},
                  color: Colors.grey,
                  icon: const Icon(Icons.grade),
                ),
              ),
            ],
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
