import 'package:flutter/material.dart';
import 'package:lassod_interview_task/utils/constants.dart';
import 'package:lassod_interview_task/utils/extensions.dart';
import 'package:lassod_interview_task/widgets/buttons.dart';
import 'package:lassod_interview_task/widgets/spaces.dart';

class WalkerDetails extends StatefulWidget {
  const WalkerDetails({Key? key}) : super(key: key);

  @override
  _WalkerDetailsState createState() => _WalkerDetailsState();
}

class _WalkerDetailsState extends State<WalkerDetails> {
  int selectedButton = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                height: context.height(),
                width: context.width(),
                decoration: const BoxDecoration(color: whiteColor),
              ),
              Positioned(
                  top: 0,
                  height: context.height(.55),
                  child: Image.asset(
                    "assets/images/dog-walker-full.png",
                  )),
              Positioned(
                bottom: 0,
                height: context.height(.55),
                child: Container(
                  width: context.width(),
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(context.width(.1))),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: context.width(.04),
                            vertical: context.height(.02)),
                        child: Column(
                          children: [
                            const FirstPart(),
                            const SpaceWDivider(),
                            _buttons(context),
                            Hspace(context.height(.03)),
                            const Details(),
                            Hspace(context.height(.03)),
                            const Summary(),
                            Hspace(context.height(.02)),
                          ],
                        ),
                      ),
                      Button(title: "Check Schedule", function: () {})
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: context.height(.05),
                  left: context.width(.04),
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: context.width(.12),
                      height: context.width(.12),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xffC4C4C4).withOpacity(.4)),
                      child: Center(
                        child: Text(
                          "x",
                          style: TextStyle(
                              color: const Color(0xffF7F7F8),
                              fontWeight: FontWeight.w900,
                              fontSize: context.width(.05)),
                        ),
                      ),
                    ),
                  )),
              Positioned(
                  top: context.height(.05),
                  right: context.width(.04),
                  child: Container(
                    // width: context.width(.12),
                    height: context.width(.12),
                    padding:
                        EdgeInsets.symmetric(horizontal: context.width(.04)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(context.width(.1)),
                        color: const Color(0xffC4C4C4).withOpacity(.4)),
                    child: Row(
                      children: [
                        Text(
                          "Verified  ",
                          style: TextStyle(
                              color: const Color(0xffF7F7F8),
                              fontWeight: FontWeight.w700,
                              fontSize: context.width(.04)),
                        ),
                        const Icon(
                          Icons.check_box,
                          color: Color(0xffF7F7F8),
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }

  Row _buttons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(context.width(.05))),
                primary:
                    selectedButton == 0 ? darkGrey : const Color(0xffF5F5F5)),
            onPressed: () {
              setState(() {
                selectedButton = 0;
              });
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: context.width(.03),
                  vertical: context.height(.015)),
              child: Text(
                "About",
                style: TextStyle(
                    color: selectedButton == 0
                        ? whiteColor
                        : const Color(0xffB0B0B0),
                    fontWeight: FontWeight.w500,
                    fontSize: context.width(.04)),
              ),
            )),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(context.width(.05))),
                primary:
                    selectedButton == 1 ? darkGrey : const Color(0xffF5F5F5)),
            onPressed: () {
              setState(() {
                selectedButton = 1;
              });
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: context.width(.03),
                  vertical: context.height(.015)),
              child: Text(
                "Location",
                style: TextStyle(
                    color: selectedButton == 1
                        ? whiteColor
                        : const Color(0xffB0B0B0),
                    fontWeight: FontWeight.w500,
                    fontSize: context.width(.04)),
              ),
            )),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(context.width(.05))),
                primary:
                    selectedButton == 2 ? darkGrey : const Color(0xffF5F5F5)),
            onPressed: () {
              setState(() {
                selectedButton = 2;
              });
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: context.width(.03),
                  vertical: context.height(.015)),
              child: Text(
                "Reviews",
                style: TextStyle(
                    color: selectedButton == 2
                        ? whiteColor
                        : const Color(0xffB0B0B0),
                    fontWeight: FontWeight.w500,
                    fontSize: context.width(.04)),
              ),
            ))
      ],
    );
  }
}

class SpaceWDivider extends StatelessWidget {
  const SpaceWDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height(.05),
      child: const Divider(thickness: 1),
    );
  }
}

class Summary extends StatelessWidget {
  const Summary({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Alex has loved dogs since childhood. He is currently a veterinary student. Visits the dog shelter we...",
          style: TextStyle(
              color: const Color(0xffB0B0B0),
              fontWeight: FontWeight.w500,
              fontSize: context.width(.035)),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: InkWell(
              onTap: () {},
              child: Text(
                "Read more",
                style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: context.width(.035)),
              )),
        )
      ],
    );
  }
}

class Details extends StatelessWidget {
  const Details({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Age",
                style: TextStyle(
                    color: lightGrey,
                    fontWeight: FontWeight.w500,
                    fontSize: context.width(.04)),
              ),
              Text(
                "30 years",
                style: TextStyle(
                    color: darkGrey,
                    fontWeight: FontWeight.w500,
                    fontSize: context.width(.04)),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Experience",
                style: TextStyle(
                    color: lightGrey,
                    fontWeight: FontWeight.w500,
                    fontSize: context.width(.04)),
              ),
              Text(
                "11 months",
                style: TextStyle(
                    color: darkGrey,
                    fontWeight: FontWeight.w500,
                    fontSize: context.width(.04)),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(),
        )
      ],
    );
  }
}

class FirstPart extends StatelessWidget {
  const FirstPart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Alex Murray",
            style: TextStyle(
                color: darkGrey,
                fontWeight: FontWeight.w700,
                fontSize: context.width(.07))),
        Hspace(context.height(.01)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Richtext(
              text1: "\$5",
              text2: "/hr",
            ),
            const RichtextDivider(),
            const Richtext(
              text1: "10",
              text2: " km",
            ),
            const RichtextDivider(),
            Row(
              children: [
                Text(
                  "4.4 ",
                  style: TextStyle(
                      color: darkGrey,
                      fontWeight: FontWeight.w500,
                      fontSize: context.width(.04)),
                ),
                Icon(
                  Icons.star,
                  color: lightGrey,
                  size: context.width(.04),
                )
              ],
            ),
            const RichtextDivider(),
            const Richtext(
              text1: "450",
              text2: " walks",
            ),
          ],
        )
      ],
    );
  }
}

class RichtextDivider extends StatelessWidget {
  const RichtextDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("|",
        style: TextStyle(
            color: lightGrey,
            fontWeight: FontWeight.w500,
            fontSize: context.width(.04)));
  }
}

class Richtext extends StatelessWidget {
  final String text1;
  final String text2;

  const Richtext({Key? key, required this.text1, required this.text2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            style: TextStyle(
                color: darkGrey,
                fontWeight: FontWeight.w500,
                fontSize: context.width(.04)),
            children: [
          TextSpan(text: text1),
          TextSpan(
            text: text2,
            style: const TextStyle(
              color: lightGrey,
            ),
          )
        ]));
  }
}
