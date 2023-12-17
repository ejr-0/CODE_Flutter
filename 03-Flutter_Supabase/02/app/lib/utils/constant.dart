import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final client = Supabase.instance.client;

///[showErrorSnackBar] custom snackbar
extension ShowSnackBar on BuildContext {
  void showErrorSnackBar(String text) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(
          text,
          style: const TextStyle(
            color: Colors.redAccent,
          ),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}