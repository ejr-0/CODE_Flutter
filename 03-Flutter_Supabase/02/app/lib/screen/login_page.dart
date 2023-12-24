import 'package:app/screen/components/button.dart';
import 'package:app/screen/components/spacerwithline.dart';
import 'package:app/screen/components/textbutton.dart';
import 'package:app/screen/components/textformfield.dart';
import 'package:app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;

  //logIn function
  Future<void> logIn({
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
      await client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (mounted) {
        Navigator.pushNamed(context, '/home');
      }
    } on AuthException catch (error) {
      if (!context.mounted) return;
      context.showErrorSnackBar(error.message);
    } catch (error) {
      if (!context.mounted) return;
      context.showErrorSnackBar('Unexpected error occured!');
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
        padding: const EdgeInsets.only(
          top: 100,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ///Icon
            const Icon(
              Icons.lock_open,
              size: 150,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  ///Email Address
                  MyTextFormField(
                    controller: _emailController,
                    label: const Text('Email Address'),
                    obscureText: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your email address...';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),

                  ///Password
                  MyTextFormField(
                    controller: _passwordController,
                    label: const Text('Password'),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your password...';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.none,
                  ),

                  ///Log in
                  isLoading
                      ? const Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: SizedBox(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : MyButton(
                          onTap: () {
                            logIn(
                                email: _emailController.text,
                                password: _passwordController.text);
                          },
                          child: const Text('Log in'),
                        ),
                ],
              ),
            ),
            const SpacerWithLine(),

            ///Sign up
            MyTextButton(
              onTap: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/registration', (route) => false);
              },
              text: const Text("Don't have an account?"),
              label: 'Sign up >>',
            ),
          ],
        ),
      ),
    );
  }
}
