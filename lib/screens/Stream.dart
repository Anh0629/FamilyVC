import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/bottom_bar.dart';
import 'package:flutter_app/screens/landing_page.dart';

class StreamScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context,AsyncSnapshot snapshot ){
        if(snapshot.connectionState != ConnectionState.active){
          return const Center(child: CircularProgressIndicator());
        }
        if(snapshot.hasError){
          return const Center(child: Text('Wrong !'));
        }
        if(snapshot.data != null){
          return BottomBarScreen();
        }
        return LandingPage();
      }
      )
    );
  }

}