import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simpleformvalidation/screen/components/textbutton.dart';
import 'package:simpleformvalidation/screen/components/textformfield.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _key = GlobalKey<FormState>();

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
          key: _key,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 35,
              left: 20,
              right: 20,
            ),
            child: Column(
              children: [
                const MyTextFormField(
                  label: Text('First Name'),
                  validateLabel: 'First Name',
                  keyboardType: TextInputType.name,
                  inputFormatters: [],
                ),
                const MyTextFormField(
                  label: Text('Last Name'),
                  validateLabel: 'Last Name',
                  keyboardType: TextInputType.name,
                  inputFormatters: [],
                ),
                const MyTextFormField(
                  label: Text('Address'),
                  validateLabel: 'Address',
                  keyboardType: TextInputType.streetAddress,
                  inputFormatters: [],
                ),
                MyTextFormField(
                  label: const Text('Mobile Number'),
                  validateLabel: 'Address',
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
                const MyTextFormField(
                  label: Text('Email Address'),
                  validateLabel: 'Email Address',
                  keyboardType: TextInputType.emailAddress,
                  inputFormatters: [],
                ),
                MyTextButton(
                  formKey: _key,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
