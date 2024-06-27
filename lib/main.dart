import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kantinwisaga1/auth/auth.gate.dart';
import 'package:kantinwisaga1/firebase_options.dart';
import 'package:kantinwisaga1/themes/theme.provider.dart';
import 'package:kantinwisaga1/utils/restaurant.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => Restaurant()),
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
