// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:registration/providers/register_provider.dart';
// import 'package:registration/screens/test.dart';

// void main() {
//   runApp(MultiProvider(
//     providers: [
//       ChangeNotifierProvider(
//         create: (_) => RegisterProvider())
//     ],
//     child: const MyApp()));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const RegisterScreen()
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:registration/screens/register_screen.dart.dart';

import 'providers/register_provider.dart';

void main() {
    runApp(MultiProvider(

    providers: [
      ChangeNotifierProvider(
        create: (_) => RegisterProvider())
    ],
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Registration Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RegisterScreen(),
    );
  }
}
