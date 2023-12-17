import 'package:app/screen/components/signupbutton.dart';
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
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  Future<void> logIn({
    required final email,
    required final password,
  }) async {
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
      if(!context.mounted) return;
      context.showErrorSnackBar(error.message);
    } catch (error) {
      if(!context.mounted) return;
      context.showErrorSnackBar('Unexpected error occured');
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
          children: [
            const Icon(
              Icons.lock_open,
              size: 150,
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    MyTextFormField(
                      controller: emailController,
                      label: const Text('Email'),
                      obscureText: false,
                    ),
                    MyTextFormField(
                      controller: passwordController,
                      label: const Text('Password'),
                      obscureText: true,
                    ),
                    isLoading
                        ? const Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: SizedBox(
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : MyTextButton(
                            onTap: () {
                              logIn(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            },
                            child: const Text('Log in'),
                          ),
                    const SpacerWithLine(),
                    SignUpButton(
                      onTap: () {},
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
