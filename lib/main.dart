import 'package:flutter/material.dart';
import 'package:flutter_socket_io/provider/login.dart';
import 'package:flutter_socket_io/screens/login_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Socket IO Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
   home: ChangeNotifierProvider(
        create: (context) => LoginProvider(),
    child: const LoginScreen(),
    ),
    );
  }
}

