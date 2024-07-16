import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPress, this.text,  this.loading=false, });
  final VoidCallback onPress;
  final text;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPress(),
      child: Container(
        alignment: Alignment.center,
        height: 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.purple),
        child: loading ?CircularProgressIndicator(color: Colors.white,): Text(
         text,
          style: TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
