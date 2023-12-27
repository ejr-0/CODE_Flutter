import 'package:app/screen/components/drawer.dart';
import 'package:app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _usernameController = TextEditingController();

  Future<void> getProfile() async {
    try {
      final userId = client.auth.currentUser!.id;
      final data =
          await client.from('profiles').select().eq('id', userId).single();

      _usernameController.text = (data['username'] ?? '') as String;
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
  }

  @override
  void initState() {
    super.initState();
    getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            client.auth.signOut();
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/',
              (route) => false,
            );
          },
          child: const Text('Log out'),
        ),
      ),
      drawer: MyDrawer(
        controller: _usernameController,
      ),
    );
  }
}
