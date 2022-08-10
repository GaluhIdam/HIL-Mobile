import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String btnText;
  final Function onBtnPressed;

  const AuthButton(
      {Key? key, required this.btnText, required this.onBtnPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Color.fromRGBO(1, 98, 153, 1),
          minimumSize: Size.fromHeight(45),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      onPressed: () {
        onBtnPressed();
      },
      child: Text(
        btnText,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
      ),
    );
  }
}
