import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController username;
  final TextEditingController emailAdd;
  final TextEditingController mobileNo;
  final TextEditingController password;
  final BuildContext context;

  const MyTextButton({
    super.key,
    required this.formKey,
    required this.username,
    required this.emailAdd,
    required this.mobileNo,
    required this.password,
    required this.context,
  });

  Future<void> _showDialog(BuildContext context) async {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Form'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                TextField(
                  readOnly: true,
                  controller: username,
                  decoration: const InputDecoration(
                    label: Text('Username'),
                  ),
                ),
                TextField(
                  readOnly: true,
                  controller: emailAdd,
                  decoration: const InputDecoration(
                    label: Text('Email Address'),
                  ),
                ),
                TextField(
                  readOnly: true,
                  controller: mobileNo,
                  decoration: const InputDecoration(
                    label: Text('Mobile Number'),
                  ),
                ),
                TextField(
                  readOnly: true,
                  controller: password,
                  decoration: const InputDecoration(
                    label: Text('Password'),
                  ),
                  obscureText: true,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          username.clear();
                          emailAdd.clear();
                          mobileNo.clear();
                          password.clear();
                        },
                        child: const Text('Reset'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Processing data',
                              ),
                            ),
                          );
                        },
                        child: const Text('Done'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: GestureDetector(
        onTap: () {
          if (formKey.currentState!.validate()) {
            _showDialog(context);
          }
        },
        child: Container(
          alignment: Alignment.center,
          width: 250,
          height: 35,
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text('Submit'),
        ),
      ),
    );
  }
}
