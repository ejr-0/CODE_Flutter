import 'package:flutter/material.dart';
import 'package:flutter_supabase/screen/home_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
      url: 'https://nenjeeuszvxqapautess.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5lbmplZXVzenZ4cWFwYXV0ZXNzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDI1MTAzNDIsImV4cCI6MjAxODA4NjM0Mn0.GPu6n65D9qJzr-m70p7K1sfSJYs0OJCDW60ON9ZaSXs');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Supabase',
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
