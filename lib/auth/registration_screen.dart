import 'package:fierbase_tutorial/auth/weigets/button.dart';
import 'package:fierbase_tutorial/auth/weigets/custom_textfile.dart';
import 'package:fierbase_tutorial/util/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:motion_toast/motion_toast.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passworldController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passworldController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
           leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios,color: Colors.white,)),
        backgroundColor: Colors.purple,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "Registration Page",
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
              hinttext: "Enter Your Password",
            ),
            SizedBox(
              height: 20,
            ),
            CustomButton(
              text: "Sign Up",
              loading: isLoading,
              onPress: () {
                if (emailController.text.isEmpty) {
                  Utils.tostmassage(context, "Enter Your Email");
                } else if (passworldController.text.isEmpty) {
                  Utils.tostmassage(context, "Enter Your Password");
                } else {
                  setState(() {
                    isLoading = true;
                  });
                  _auth
                      .createUserWithEmailAndPassword(
                          email: emailController.text,
                          password: passworldController.text)
                      .then((value) {
                    setState(() {
                      isLoading = false;
                    });
                    final snackBar = SnackBar(
                      content: Text('Registration Successful!'),
                      backgroundColor: Colors.teal,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    emailController.clear();
                    passworldController.clear();
                  }).onError((error, StackTrace) {
                    final snackBar = SnackBar(
                      content: Text('Registration Failed! ${error.toString()}'),
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
                TextButton(onPressed: () {}, child: Text("Sign Up"))
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
