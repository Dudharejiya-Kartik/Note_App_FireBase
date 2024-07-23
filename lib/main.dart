import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:note_app_firebase/presentation/home_page/home_page.dart';
import 'package:note_app_firebase/presentation/notes_page/notes_page.dart';
import 'package:note_app_firebase/presentation/signup_page/signup_page.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SignUpPage(),
        'home_page': (context) => const Home_Page(),
        'notes': (context) => const NotesPage(),
      },
    );
  }
}
