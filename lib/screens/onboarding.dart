import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lassod_interview_task/utils/constants.dart';
import 'package:lassod_interview_task/utils/extensions.dart';
import 'package:lassod_interview_task/widgets/buttons.dart';
import 'package:lassod_interview_task/widgets/spaces.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff202020),
      appBar: AppBar(
        backgroundColor: const Color(0xffF6F7F8),
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: SizedBox(
            height: context.height() - MediaQuery.of(context).padding.top,
            child: Column(
              children: const [
                Top(),
                Bottoms(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Top design: including, logo,  image and page counter
class Top extends StatelessWidget {
  const Top({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Image.asset(
            "assets/images/onboarding_picture.png",
            width: context.width(),
            fit: BoxFit.fill,
          ),
          Positioned(
              left: context.width(.04),
              top: context.height(.04),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/icons/logo.png",
                    height: context.width(.1),
                  ),
                  Column(
                    children: [
                      Text(
                        "WOO",
                        style: TextStyle(
                            color: const Color(0xffE73A40),
                            fontWeight: FontWeight.w900,
                            height: 1,
                            fontSize: context.width(.05)),
                      ),
                      Text(
                        "DOG",
                        style: TextStyle(
                            color: const Color(0xffE73A40),
                            fontWeight: FontWeight.w900,
                            height: 1,
                            fontSize: context.width(.05)),
                      ),
                    ],
                  )
                ],
              )),
          Positioned(
              bottom: context.height(.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const PageCounter(
                    title: '1',
                    color: whiteColor,
                  ),
                  Text(
                    "—",
                    style: TextStyle(
                        color: whiteColor,
                        fontWeight: FontWeight.w500,
                        fontSize: context.width(.04)),
                  ),
                  const PageCounter(
                    title: '2',
                    color: Color(0xff404040),
                  ),
                  Text(
                    "—",
                    style: TextStyle(
                        color: whiteColor,
                        fontWeight: FontWeight.w500,
                        fontSize: context.width(.04)),
                  ),
                  const PageCounter(
                    title: '3',
                    color: Color(0xff404040),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}

// bottom design: including texts and button

class Bottoms extends StatelessWidget {
  const Bottoms({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        children: [
          Text(
            "Too tired to walk your dog?",
            style: TextStyle(
                color: whiteColor,
                fontWeight: FontWeight.w700,
                fontSize: context.width(.055)),
          ),
          Text("Let's help you!",
              style: TextStyle(
                  color: whiteColor,
                  fontWeight: FontWeight.w700,
                  fontSize: context.width(.055))),
          Hspace(context.height(.025)),
          Button(
            title: 'Join our community',
            function: () => Navigator.pushNamed(context, "/signup"),
          ),
          Hspace(context.height(.03)),
          RichText(
              text: TextSpan(
                  style: TextStyle(
                      color: whiteColor,
                      fontWeight: FontWeight.w500,
                      fontSize: context.width(.04)),
                  children: [
                const TextSpan(text: "Already a member? "),
                TextSpan(
                  text: "Sign in",
                  recognizer: TapGestureRecognizer()..onTap = () {},
                  style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.w700,
                      fontSize: context.width(.04)),
                ),
              ]))
        ],
      ),
    );
  }
}

// Page counter circle widget found on the onboarding page.
class PageCounter extends StatelessWidget {
  final String title;
  final Color color;

  const PageCounter({required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.width(.08),
      width: context.width(.08),
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: Center(
          child: Text(
        title,
        style: TextStyle(
            color: color == whiteColor ? blackColor : whiteColor,
            fontWeight: FontWeight.w500,
            fontSize: context.width(.035)),
      )),
    );
  }
}
