import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lassod_interview_task/utils/constants.dart';
import 'package:lassod_interview_task/utils/extensions.dart';
import 'package:lassod_interview_task/widgets/spaces.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: context.width(.04), vertical: context.height(.02)),
          child: Column(
            children: [
              const HomeHeader(),
              Hspace(context.height(.01)),
              const LocationSelector(
                icon: Icon(
                  Icons.location_on_outlined,
                  color: Color(0xffA1A1A1),
                ),
                title: "  Kyiv, Ukraine",
              ),
              Hspace(context.height(.03)),
              const HorizontalListView("Near you"),
              const Divider(thickness: 1),
              Hspace(context.height(.015)),
              const HorizontalListView("Suggested"),
            ],
          ),
        ),
      ),
    );
  }
}

// location selector widget under the page header
class LocationSelector extends StatelessWidget {
  final String title;
  final Widget icon;

  const LocationSelector({Key? key, required this.title, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: context.width(.125),
      padding: EdgeInsets.symmetric(
          horizontal: context.width(.04), vertical: context.height(.013)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(context.width(.03)),
          color: const Color(0xffF0F0F0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              icon,
              Text(title,
                  style: TextStyle(
                      color: const Color(0xffA1A1A1),
                      fontWeight: FontWeight.w400,
                      fontSize: context.width(.045))),
            ],
          ),
          const Icon(
            Icons.sort,
            color: Color(0xffA1A1A1),
          ),
        ],
      ),
    );
  }
}

// horizontal listview containing few details about the dog walkers neaar you
class HorizontalListView extends StatelessWidget {
  final String title;

  const HorizontalListView(this.title);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style: TextStyle(
                    color: darkGrey,
                    height: 1,
                    fontWeight: FontWeight.w700,
                    fontSize: context.width(.075))),
            Text("View all",
                style: TextStyle(
                    color: darkGrey,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w400,
                    fontSize: context.width(.04))),
          ],
        ),
        Hspace(context.height(.02)),
        SizedBox(
          height: context.height(.23),
          child: Center(
            child: ListView.builder(
              itemCount: 10,
              // shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(right: context.width(.08)),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () =>
                          Navigator.pushNamed(context, "/walker_details"),
                      child: Image.asset(
                        "assets/images/dog-walker${index % 2}.png",
                        height: context.height(.15),
                        width: context.height(.25),
                      ),
                    ),
                    Hspace(context.height(.02)),
                    SizedBox(
                      width: context.width(.5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Text("Mason Yorkshire",
                                  style: TextStyle(
                                      color: darkGrey,
                                      height: 1,
                                      fontWeight: FontWeight.w500,
                                      fontSize: context.width(.035))),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on_outlined,
                                    color: Color(0xffA1A1A1),
                                  ),
                                  Text("${Random().nextInt(20)} km from you",
                                      style: TextStyle(
                                          color: const Color(0xffA1A1A1),
                                          fontWeight: FontWeight.w500,
                                          height: 1,
                                          fontSize: context.width(.035))),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: context.width(.02),
                                horizontal: context.width(.03)),
                            decoration: BoxDecoration(
                                color: darkGrey,
                                borderRadius:
                                    BorderRadius.circular(context.width(.02))),
                            child: Text(
                              "\$5/hr",
                              style: TextStyle(
                                  color: lightGrey,
                                  height: 1,
                                  fontSize: context.width(.03)),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

// header of page
class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.width(.2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Home",
                  style: TextStyle(
                      color: darkGrey,
                      fontWeight: FontWeight.w700,
                      fontSize: context.width(.07))),
              Text("Explore dog walkers",
                  style: TextStyle(
                      color: const Color(0xff7A7A7A),
                      fontWeight: FontWeight.w500,
                      fontSize: context.width(.04))),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  colors: [Color(0xffFE904B), Color(0xffFB724C)]),
              borderRadius:
                  BorderRadius.all(Radius.circular(context.width(.05))),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {},
                child: SizedBox(
                  width: context.width(.35),
                  height: context.height(.06),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(
                          Icons.add,
                          color: whiteColor,
                        ),
                        Text("Book a walk",
                            style: TextStyle(
                                color: whiteColor,
                                fontWeight: FontWeight.w700,
                                fontSize: context.width(.03))),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
