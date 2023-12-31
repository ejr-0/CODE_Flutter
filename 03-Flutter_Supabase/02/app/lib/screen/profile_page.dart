import 'package:app/screen/components/avatar.dart';
import 'package:app/screen/components/button.dart';
import 'package:app/screen/components/drawer.dart';
import 'package:app/screen/components/textformfield.dart';
import 'package:app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _websiteURLController = TextEditingController();
  String? _avatarURL;
  bool isLoading = false;

  Future<void> getProfile() async {
    setState(() {
      isLoading = true;
    });

    try {
      final userId = client.auth.currentUser!.id;
      final data =
          await client.from('profiles').select().eq('id', userId).single();

      _usernameController.text = (data['username'] ?? '') as String;
      _fullnameController.text = (data['full_name'] ?? '') as String;
      _websiteURLController.text = (data['website'] ?? '') as String;
      _avatarURL = (data['avatar_url'] ?? '') as String;
    } on PostgrestException catch (error) {
      if (!context.mounted) return;
      context.showErrorSnackBar(error.message);
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

  Future<void> updateProfile() async {
    final username = _usernameController.text.trim();
    final fullname = _fullnameController.text.trim();
    final website = _websiteURLController.text.trim();

    final user = client.auth.currentUser;

    final updates = {
      'id': user!.id,
      'username': username,
      'full_name': fullname,
      'website': website,
      'updated_at': DateTime.now().toIso8601String(),
    };

    final isValid = _formKey.currentState?.validate();

    if (isValid != true) {
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      await client.from('profiles').upsert(updates);
      if (mounted) {
        context.showErrorSnackBar('Update successfully...');
      }
    } on PostgrestException catch (error) {
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

  ///[onUpload] function
  Future<void> onUpload(String imageURL) async {
    setState(() {
      isLoading = true;
    });

    try {
      await client.from('profiles').upsert({
        'id': client.auth.currentUser!.id,
        'avatar_url': imageURL,
      });
      if (mounted) {
        Navigator.popAndPushNamed(context, '/profile');
        context.showErrorSnackBar('Profile image updated!.');
      }
    } on PostgrestException catch (error) {
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
  void initState() {
    super.initState();
    getProfile();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _fullnameController.dispose();
    _websiteURLController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      drawer: MyDrawer(
        controller: _usernameController,
        imageURL: _avatarURL,
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.only(top: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    AvatarWidget(
                      imageURL: _avatarURL,
                      onUpload: onUpload,
                    ),
                    MyTextFormField(
                      controller: _usernameController,
                      label: const Text('User name'),
                      obscureText: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter username';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                    ),
                    MyTextFormField(
                      controller: _fullnameController,
                      label: const Text('Full name'),
                      obscureText: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter username';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                    ),
                    MyTextFormField(
                      controller: _websiteURLController,
                      label: const Text('Website URL'),
                      obscureText: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter username';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.url,
                    ),
                    MyButton(
                      onTap: updateProfile,
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
