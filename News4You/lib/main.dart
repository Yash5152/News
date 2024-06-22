import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news4you/Pages/SplashScreen.dart';
import 'package:news4you/Pages/no_internet.dart';
import 'package:news4you/mainPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.aBeeZeeTextTheme(),
      ),
      home: OfflineBuilder(
        connectivityBuilder: (BuildContext context,
            ConnectivityResult connectivity, Widget child) {
          if (connectivity == ConnectivityResult.none) {
            return InternetOffPage(); // Display InternetOffPage if no connection
          } else {
            return const Newsapp(); // Navigate to MyHomePage if connected
          }
        },
        child: const Center(
          child: Text('Waiting for connection...'), // Optional waiting widget
        ),
      ),
    );
  }
}
