import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pixel/resources/auth_methods.dart';
import 'package:pixel/screens/home_screen.dart';
import 'package:pixel/screens/login_screen.dart';
import 'package:pixel/utils/colors.dart';
import 'package:pixel/screens/video_call_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) { 
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pixel',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      routes: {
        '/login':(context) => const Loginscreen(),
        '/home':(context) => const HomeScreen(),
        '/video-call':(context) =>  const VideocallScreen(),
      },
      home: StreamBuilder(
        stream: AuthMethods().authchanges,
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if(snapshot.hasData){
            return const HomeScreen();
          }

          return const Loginscreen();
        },
      ),
    );
  }
}

