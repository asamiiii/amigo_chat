import 'package:amigo_chat/screens/registration/reg_view.dart';
import 'package:amigo_chat/theme/light.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Flutter Demo',
      theme: ThemeData(
          textTheme: TextTheme(
              headline1: TextStyle(
                  color: white, fontSize: 20, fontWeight: FontWeight.bold))),
      initialRoute: RegistrationView.routeName,
      routes: {RegistrationView.routeName: (context) => RegistrationView()},
      home: null,
    );
  }
}
