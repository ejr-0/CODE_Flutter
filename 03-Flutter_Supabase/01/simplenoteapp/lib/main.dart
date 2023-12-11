import 'package:flutter/material.dart';
import 'package:simplenoteapp/screen/home_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://xoveviwcqgghcgmlzteq.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhvdmV2aXdjcWdnaGNnbWx6dGVxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDIyNjAxMTQsImV4cCI6MjAxNzgzNjExNH0.dCPpfccl_dbsOjjheVO2GAGssoRpQ9llHch8hV97OWk',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple login with Supabase',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
