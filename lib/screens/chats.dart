import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lassod_interview_task/screens/homepage.dart';
import 'package:lassod_interview_task/screens/walker_details.dart';
import 'package:lassod_interview_task/utils/constants.dart';
import 'package:lassod_interview_task/utils/extensions.dart';
import 'package:lassod_interview_task/widgets/spaces.dart';

class Chats extends StatefulWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  List<String> names = [
    "Will Knowles",
    "Bob Dylan",
    "Freddie Mercury",
    "Bruce Springsteen",
    "Missy Elliott"
  ];

  List<String> messages = [
    "Hey! How’s your dog?",
    "Let’s go out!",
    "How are you doing?",
    "When are you getting back?",
    "Thanks"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: context.width(.04), vertical: context.height(.02)),
          child: const LocationSelector(
              title: "  Search...",
              icon: Icon(
                Icons.search,
                color: Color(0xffA1A1A1),
              )),
        ),
        Hspace(context.height(.01)),
        const Divider(),
        Chatlist(names: names, messages: messages)
      ],
    );
  }
}



// listview widget of all chats
class Chatlist extends StatelessWidget {
  const Chatlist({
    Key? key,
    required this.names,
    required this.messages,
  }) : super(key: key);

  final List<String> names;
  final List<String> messages;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: names.length * 2,
        itemBuilder: (context, index) => InkWell(
          onTap: () => Navigator.pushNamed(context, "/messages"),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: context.height(.015),
                    horizontal: context.width(.04)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: context.width(.13),
                            height: context.width(.13),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                        'assets/images/dog-walker${index % 2}.png')))),
                        Wspace(context.width(.02)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(names[index % 4],
                                style: TextStyle(
                                    color: darkGrey,
                                    fontWeight: FontWeight.w700,
                                    fontSize: context.width(.05))),
                            RichText(
                                text: TextSpan(
                                    style: TextStyle(
                                        color: const Color(0xff4F4F4F),
                                        fontWeight: FontWeight.w500,
                                        fontSize: context.width(.035)),
                                    children: [
                                  TextSpan(text: "${messages[index % 4]} "),
                                  TextSpan(
                                    text: "· ${Random().nextInt(30)} mins",
                                    style: TextStyle(
                                        color: lightGrey,
                                        fontWeight: FontWeight.w400,
                                        fontSize: context.width(.035)),
                                  )
                                ])),
                          ],
                        )
                      ],
                    ),
                    Visibility(
                      visible: index % 4 == 2,
                      child: Icon(
                        Icons.circle,
                        color: primaryColor,
                        size: context.width(.025),
                      ),
                    )
                  ],
                ),
              ),
              const Divider()
            ],
          ),
        ),
      ),
    );
  }
}





class ChatAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const ChatAppbar({Key? key, required this.preferredSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: whiteColor,
      elevation: 0,
      title: Row(
        children: [
          Text("Chat",
              style: TextStyle(
                  color: darkGrey,
                  fontWeight: FontWeight.w700,
                  fontSize: context.width(.07))),
        ],
      ),
    );
  }
}
