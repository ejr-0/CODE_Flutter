import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _notes = Supabase.instance.client
      .from('notes')
      .select<List<Map<String, dynamic>>>();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('data'),
    );
  }
}
