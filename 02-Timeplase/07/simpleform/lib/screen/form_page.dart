import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simpleform/screen/components/textbutton.dart';
import 'package:simpleform/screen/components/textformfield.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _emailAdd = TextEditingController();
  final TextEditingController _mobileNo = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        title: const Text('Simple Form'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyTextFormField(
                label: 'Username',
                validateLabel: 'Username',
                keyboardType: TextInputType.none,
                inputFormatters: const [],
                controller: _username,
                obscureText: false,
              ),
              MyTextFormField(
                label: 'Email Address',
                validateLabel: 'Email Address',
                keyboardType: TextInputType.emailAddress,
                inputFormatters: const [],
                controller: _emailAdd,
                obscureText: false,
              ),
              MyTextFormField(
                label: 'Mobile Number',
                validateLabel: 'Mobile Number',
                keyboardType: TextInputType.emailAddress,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                controller: _mobileNo,
                obscureText: false,
              ),
              MyTextFormField(
                label: 'Password',
                validateLabel: 'Password',
                keyboardType: TextInputType.visiblePassword,
                inputFormatters: const [],
                controller: _password,
                obscureText: true,
              ),
              MyTextButton(
                formKey: _formKey,
                username: _username,
                emailAdd: _emailAdd,
                mobileNo: _mobileNo,
                password: _password,
                context: context,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
