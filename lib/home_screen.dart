import 'package:fierbase_tutorial/auth/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "Home Screen",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                _auth.signOut().then((value) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                }).onError((error, StackTrace) {
                  debugPrint(error.toString());
                  final snackBar = SnackBar(
                    content: Text('Login Failed! ${error.toString()}'),
                    backgroundColor: Colors.red,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                });
              },
              icon: Icon(
                Icons.logout_outlined,
                color: Colors.white,
              )),
          SizedBox(
            width: 5,
          )
        ],
      ),
    );
  }
}
