import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyC76dNMdR0OMyJcHr4ljxhcwceLw0SNQQY",
          authDomain: "my-portfolio-aa4bf.firebaseapp.com",
          projectId: "my-portfolio-aa4bf",
          storageBucket: "my-portfolio-aa4bf.appspot.com",
          messagingSenderId: "340853420806",
          appId: "1:340853420806:web:35bbf137340a649be66487",
          measurementId: "G-WJ8XJWEKVY"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: 'Melaku B.',
      home: HomePage(),
    );
  }
}
