import 'package:app/screen/home_page.dart';
import 'package:app/screen/login_page.dart';
import 'package:app/screen/profile_page.dart';
import 'package:app/screen/registration_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: "https://fwdnrbuxzfsckmzsfoxp.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ3ZG5yYnV4emZzY2ttenNmb3hwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDM2NjM5MDAsImV4cCI6MjAxOTIzOTkwMH0.suQC7PEoac-IA0UYdVd8m7hYp27ZpMI659G61WHc00k",
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
