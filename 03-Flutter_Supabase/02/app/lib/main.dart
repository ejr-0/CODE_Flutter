import 'package:app/screen/home_page.dart';
import 'package:app/screen/login_page.dart';
import 'package:app/screen/profile_page.dart';
import 'package:app/screen/registration_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: "https://sjdopymzgfvqxwonczjt.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNqZG9weW16Z2Z2cXh3b25jemp0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDI3Nzk3NzcsImV4cCI6MjAxODM1NTc3N30.3XfYyQgekBnhXDT0RVbd4s25vjBDUk6u51cZGAccC2A",
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/registration': (context) => const RegistrationPage(),
        '/profile': (context) => const ProfilePage(),
      },
      initialRoute: '/',
    );
  }
}
