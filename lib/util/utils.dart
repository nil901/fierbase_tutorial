import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:motion_toast/motion_toast.dart';

class Utils{
 static void tostmassage(context,msg){
    MotionToast(
	icon:  Icons.zoom_out,
	primaryColor: Colors.red,
	//secondaryColor:  Colors.grey,
  secondaryColor: Colors.transparent,
	title:  Text(msg,style:TextStyle(fontSize: 15,color: Colors.white),),
	description:  Text(''),
	position:  MotionToastPosition.top,
	animationType:  AnimationType.fromTop,
	height:  50,
  width: 350,
	
).show(context);
  } 

  void myTostmsg( String msg){
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}