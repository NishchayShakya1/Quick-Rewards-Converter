// ignore_for_file: dead_code

import 'package:cashitout/controller/Home/home.dart';

import 'package:cashitout/widgets/Components/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'controller/Provider/google_sign_in.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  final bool showHome;

  const MyApp({
    Key key,
    this.showHome,
  }) : super(key: key);
  // static final String title = 'Google SignIn';
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => GoogleSignInProvider()),
          //   ChangeNotifierProvider(create: (context) => EmailSignInProvider()),
        ],
        child: MaterialApp(
            themeMode: ThemeMode.system,
            theme: MyTheme.lightTheme,
            darkTheme: MyTheme.darkTheme,
            debugShowCheckedModeBanner: false,
            home: const Home()
            // SplashScreen(showHome: showHome),
            //  routes: {},
            ),
      );
}
