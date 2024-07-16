import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
   CustomTextFiled({super.key, required this.controller, this.hinttext});
  final TextEditingController controller;
  final hinttext;
  @override
  Widget build(BuildContext context) {
    return Material(
              elevation: 2,
              borderRadius: BorderRadius.circular(10),
              child: Container (
                height: 45,
                decoration: BoxDecoration(  
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: TextFormField(
                    controller: controller,
                    decoration: InputDecoration( 
                      hintText: hinttext,
                      border: InputBorder.none
                    ),
                  ),
                ),
              ),
            );
  }
}