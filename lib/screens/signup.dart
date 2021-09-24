import 'package:flutter/material.dart';
import 'package:lassod_interview_task/utils/constants.dart';
import 'package:lassod_interview_task/utils/extensions.dart';
import 'package:lassod_interview_task/widgets/buttons.dart';
import 'package:lassod_interview_task/widgets/spaces.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController fullname = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  bool toggle = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: darkGrey,
            )),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width(.04)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hspace(context.height(.02)),
                Text("Let's start here",
                    style: TextStyle(
                        color: darkGrey,
                        fontWeight: FontWeight.w700,
                        fontSize: context.width(.08))),
                Text("Fill in your details to begin",
                    style: TextStyle(
                        color: const Color(0xff7A7A7A),
                        fontWeight: FontWeight.w500,
                        fontSize: context.width(.04))),
                Hspace(context.height(.03)),
                Textspace(
                  title: "Fullname",
                  icon: const Icon(Icons.ac_unit, color: Colors.transparent),
                  controller: fullname,
                ),
                Hspace(context.height(.03)),
                Textspace(
                  title: "E-mail",
                  icon: const Icon(Icons.ac_unit, color: Colors.transparent),
                  controller: email,
                ),
                Hspace(context.height(.03)),
                Textspace(
                  title: "Password",
                  obscure: toggle,
                  icon: IconButton(
                      onPressed: () {
                        setState(() {
                          toggle = !toggle;
                        });
                      },
                      icon: Icon(
                          !toggle ? Icons.visibility : Icons.visibility_off)),
                  controller: password,
                )
              ],
            ),
          ),
          Hspace(context.height(.05)),
          Button(
              title: "Sign Up",
              function: () {
                Navigator.pushNamed(context, "/home");
              })
        ],
      ),
    );
  }
}

// textformfield widget used on the signup page.
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
