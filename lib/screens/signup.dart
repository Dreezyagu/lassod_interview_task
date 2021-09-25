import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lassod_interview_task/cubits/signup/signup_cubit.dart';
import 'package:lassod_interview_task/utils/constants.dart';
import 'package:lassod_interview_task/utils/extensions.dart';
import 'package:lassod_interview_task/widgets/buttons.dart';
import 'package:lassod_interview_task/widgets/spaces.dart';
import 'package:lassod_interview_task/widgets/textspace.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController fullname = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool loading = false;
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
                  key: const Key("signUpButton"),
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
              loading: loading,
              function: () {
                BlocProvider.of<SignupCubit>(context).signUp(
                    fullname: fullname.text,
                    password: password.text,
                    email: email.text);
              }),

          Hspace(context.height(.15)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width(.1)),
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    style: TextStyle(
                        color: const Color(0xff7A7A7A),
                        fontWeight: FontWeight.w500,
                        fontSize: context.width(.035)),
                    children: [
                      const TextSpan(text: "By signing in, I agree with "),
                      TextSpan(
                        text: "Terms of Use and Privacy Policy",
                        style: TextStyle(
                            color: darkGrey,
                            fontWeight: FontWeight.w500,
                            fontSize: context.width(.035)),
                      )
                    ])),
          ),
          //listens to the SignUpCubit and performs actions based on the current state.
          BlocListener<SignupCubit, SignupState>(
            listener: (context, state) {
              if (state is SignupLoading) {
                setState(() {
                  loading = true;
                });
              } else if (state is SignupLoaded || state is SignupError) {
                setState(() {
                  loading = false;
                });
                Navigator.pushNamed(context, "/home");
              }
            },
            child: Container(),
          ),
        ],
      ),
    );
  }
}
