import 'package:flutter/material.dart';
import 'package:lassod_interview_task/utils/constants.dart';

import 'package:lassod_interview_task/utils/extensions.dart';



class Textspace extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final Widget icon;
  final bool obscure;

  const Textspace(
      {Key? key,
      this.obscure = false, 
      required this.title,
      required this.controller,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
          color: darkGrey,
          fontWeight: FontWeight.w500,
          fontSize: context.width(.04)),
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xffF0F0F0),
          contentPadding: EdgeInsets.all(context.width(.04)),
          labelText: title,
          suffixIcon: icon,
          labelStyle: const TextStyle(color: lightGrey),
          border: UnderlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(
                context.width(.05),
              ))),
    );
  }
}