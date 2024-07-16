import 'package:fierbase_tutorial/auth/weigets/button.dart';
import 'package:fierbase_tutorial/auth/weigets/custom_textfile.dart';
import 'package:flutter/material.dart';

class LoginWithPhoneNumber extends StatefulWidget {
  const LoginWithPhoneNumber({super.key});

  @override
  State<LoginWithPhoneNumber> createState() => _LoginWithPhoneNumberState();
}

class _LoginWithPhoneNumberState extends State<LoginWithPhoneNumber> {
  TextEditingController _mobileNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios,color: Colors.white,)),
        title: Text(
          "Login With Phone Number",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 5),
        child: Column(  
          children: [
            SizedBox(height: 10,),
        CustomTextFiled(controller: _mobileNumberController,hinttext: "Enter Mobile Number",),
        SizedBox(height: 20,),
        CustomButton(onPress: (){

        },text: "Login",)
          ],
        ),
      ),
    );
  }
}