import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:initiation_flutter/common/theme.dart';
import 'package:initiation_flutter/routes/routes.dart';
import 'package:initiation_flutter/views/home.dart';
import 'package:initiation_flutter/views/splash_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightThemeData(context),
        darkTheme: darkThemeData(context),
        home: SplashScreen(),
        routes: {
          NavigationRoutes.home: (BuildContext context) => Home()
        },
      );
  }
}
