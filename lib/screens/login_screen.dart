import 'package:flutter/material.dart';
import 'package:pixel/resources/auth_methods.dart';
import 'package:pixel/widgets/custom_button.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {

  final AuthMethods _authMethods = AuthMethods();
  @override
  Widget build( context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical : 38.0),
            child: const Text('Start ot join the meeting',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),
            ),
          ),
          Image.asset('assets/images/onboarding.jpg'),
          CustomButton(
            text: 'Sign In',
            
            onPressed: () async{
              bool res = await _authMethods.signInWithGoogle(context);
              if(res){
                Navigator.pushNamed(context, '/home');
              }

          },),
        ],
      ),
    );
  }
}