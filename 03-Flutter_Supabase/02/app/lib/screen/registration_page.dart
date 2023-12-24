import 'package:app/screen/components/button.dart';
import 'package:app/screen/components/spacerwithline.dart';
import 'package:app/screen/components/textbutton.dart';
import 'package:app/screen/components/textformfield.dart';
import 'package:app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;

  ///registration function
  Future<void> registrationFunc({
    required final email,
    required final password,
  }) async {
    final isValid = _formKey.currentState?.validate();
    if (isValid != true) {
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      await client.auth.signUp(
        email: email,
        password: password,
      );
      if (mounted) {
        Navigator.popAndPushNamed(context, '/');
        context.showErrorSnackBar('Confirm your account');
      }
    } on AuthException catch (error) {
      if (!context.mounted) return;
      context.showErrorSnackBar(error.message);
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.app_registration,
              size: 150,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  ///email
                  MyTextFormField(
                    controller: _emailController,
                    label: const Text('Email Address'),
                    obscureText: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email address...';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),
                  ///password
                  MyTextFormField(
                    controller: _passwordController,
                    label: const Text('Password'),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.none,
                  ),
                  ///register button
                  isLoading
                      ? const Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: SizedBox(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : MyButton(
                          onTap: () {
                            registrationFunc(
                              email: _emailController.text,
                              password: _passwordController.text,
                            );
                            _emailController.clear();
                            _passwordController.clear();
                          },
                          child: const Text('Register'),
                        ),
                  const SpacerWithLine(),
                  ///login text button
                  MyTextButton(
                    onTap: () {
                      Navigator.pushNamed(context, '/');
                    },
                    text: const Text('Do you have an account?'),
                    label: 'Log in >>',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
