import 'package:fierbase_tutorial/auth/login_with_phone_number.dart';
import 'package:fierbase_tutorial/auth/registration_screen.dart';
import 'package:fierbase_tutorial/auth/weigets/button.dart';
import 'package:fierbase_tutorial/auth/weigets/custom_textfile.dart';
import 'package:fierbase_tutorial/home_screen.dart';
import 'package:fierbase_tutorial/util/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passworldController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  bool isLoading = false;
  final _remoteConfig =FirebaseRemoteConfig.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _remoteConfigIn();
   
  }
  _remoteConfigIn()async{ 
    setState(() {
      isLoading = true;
    });
   await  _remoteConfig.setDefaults({"name":"Nilesh Pathak",
    "age":"24"
    });
    await _remoteConfig.setConfigSettings(RemoteConfigSettings(fetchTimeout: Duration(seconds: 10), minimumFetchInterval: Duration(seconds: 10)));
    await _remoteConfig.fetchAndActivate();
    setState(() {
      isLoading = false;
    });
  }
  void login() {
    _auth
        .signInWithEmailAndPassword(
            email: emailController.text, password: passworldController.text)
        .then((value) {
      final snackBar = SnackBar(
        content: Text('Login Successful!'),
        backgroundColor: Colors.teal,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      emailController.clear();
      passworldController.clear();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
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
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passworldController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "Login",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextFiled(
              controller: emailController,
              hinttext: "Enter Your Email",
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextFiled(
              controller: passworldController,
              hinttext: "Enter Your Passworld",
            ),
            SizedBox(
              height: 20,
            ),
            CustomButton(
              loading: isLoading,
              text: "Login",
              onPress: () {
                if (emailController.text.isEmpty) {
                  Utils.tostmassage(context, "Enter Your Email");
                } else if (passworldController.text.isEmpty) {
                  Utils.tostmassage(context, "Enter Your Passworld");
                } else {
                  login();
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Create New Account?"),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegistrationScreen()));
                    },
                    child: Text("Sign Up"))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => LoginWithPhoneNumber()));
                throw Exception();
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black)),
                child: Center(
                  child: Text("Exption"),
                ),
              ),
            ),
            SizedBox(height: 15,),
             InkWell(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => LoginWithPhoneNumber()));
                throw FormatException("Test Exption Logic");
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black)),
                child: Center(
                  child: Text("throw Format Expetion"),
                ),
              ),
            ),
             SizedBox(height: 15,),
          isLoading ? CircularProgressIndicator():  Text("Name :- ${_remoteConfig.getString("name")}")
          ],
        ),
      ),
    );
  }
}
