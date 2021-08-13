import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//LAYOUT PARA O TEXT FIELD
Widget buildTextField(
  BuildContext context,
  IconData icon,
  String hintText,
  bool isPassword,
  var loginController,
) {
  return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.01),
      child: TextFormField(
        controller: loginController,
        obscureText: isPassword,
        decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: Colors.blue[800].withOpacity(0.8),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[350]),
                borderRadius: BorderRadius.all(Radius.circular(35))),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[350]),
                borderRadius: BorderRadius.all(Radius.circular(35))),
            labelText: hintText,
            hintStyle: TextStyle(
                fontSize: 14, color: Colors.grey[800].withOpacity(0.4))),
      ));
}
