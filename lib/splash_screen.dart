import 'package:fierbase_tutorial/fierbase_services/fierbase_services.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> { 
  SplashServics _splashServics = SplashServics();
  @override
  void initState() {
    // TODO: implement initState
    super.initState(); 
    _splashServics.isLogin(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(  
        child: Text("FierBase Tutorial",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.yellow),),
      ),
    );
  }
}