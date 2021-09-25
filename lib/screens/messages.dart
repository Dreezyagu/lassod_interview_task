import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lassod_interview_task/utils/constants.dart';
import 'package:lassod_interview_task/utils/extensions.dart';
import 'package:lassod_interview_task/widgets/spaces.dart';

class Messages extends StatefulWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {

    // to take the list to the bottom (last sent message) upon opening.
    Timer(
      const Duration(milliseconds: 1),
      () => _controller.jumpTo(_controller.position.maxScrollExtent),
    );

// page appbar
    final AppBar appBar = AppBar(
      elevation: 0,
      backgroundColor: whiteColor,
      leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: darkGrey,
          )),
      title: Row(
        children: [
          Container(
              width: context.width(.12),
              height: context.width(.12),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/dog-walker1.png')))),
          Wspace(context.width(.02)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Alex Murray",
                style: TextStyle(
                    color: darkGrey,
                    fontWeight: FontWeight.w700,
                    fontSize: context.width(.045)),
              ),
              Row(
                children: [
                  Icon(
                    Icons.circle,
                    color: const Color(0xff5AD439),
                    size: context.width(.02),
                  ),
                  Text(
                    " Online",
                    style: TextStyle(
                        color: const Color(0xffAEAEB2),
                        fontWeight: FontWeight.w500,
                        fontSize: context.width(.035)),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.phone,
              color: darkGrey,
            )),
        const SizedBox(
          width: 20,
        )
      ],
    );



    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: EdgeInsets.only(
          left: context.width(.04),
          right: context.width(.04),
          bottom: context.height(.03),
          top: context.height(.01),
        ),
        child: SizedBox(
          height: context.height() -
              appBar.preferredSize.height -
              MediaQuery.of(context).padding.top,
          child: Column(
            children: [
              MessagesList(controller: _controller),
              const Sender(),
            ],
          ),
        ),
      ),
    );
  }
}

class MessagesList extends StatelessWidget {
  const MessagesList({
    Key? key,
    required ScrollController controller,
  })  : _controller = controller,
        super(key: key);

  final ScrollController _controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemCount: 10,
      controller: _controller,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Text("12:0$index",
                style: TextStyle(
                    color: const Color(0xffAEAEB2),
                    fontWeight: FontWeight.w400,
                    fontSize: context.width(.035))),
            Padding(
              padding: EdgeInsets.symmetric(vertical: context.height(.02)),
              child: index % 2 == 1
                  ? const SentMessage()
                  : const ReceivedMessage(),
            ),
          ],
        );
      },
    ));
  }
}





// received message widget
class ReceivedMessage extends StatelessWidget {
  const ReceivedMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: Container(
            width: context.width(.6),
            decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(context.width(.02)),
                  topRight: Radius.circular(context.width(.02)),
                  bottomLeft: Radius.circular(context.width(.02)),
                )),
            padding: EdgeInsets.symmetric(
                horizontal: context.width(.04),
                vertical: context.height(.015)),
            child: Text(
              "Hi! That’s great! Let me give you a call and we’ll discuss all the details",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: whiteColor,
                  fontWeight: FontWeight.w400,
                  fontSize: context.width(.035)),
            )),
      );
  }
}







//sent message syntax
class SentMessage extends StatelessWidget {
  const SentMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Container(
            width: context.width(.6),
            decoration: BoxDecoration(
                color: const Color(0xffECEEF1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(context.width(.02)),
                  topRight: Radius.circular(context.width(.02)),
                  bottomRight:
                      Radius.circular(context.width(.02)),
                )),
            padding: EdgeInsets.symmetric(
                horizontal: context.width(.04),
                vertical: context.height(.015)),
            child: Text(
              "Hi! That’s great! Let me give you a call and we’ll discuss all the details",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: darkGrey,
                  fontWeight: FontWeight.w400,
                  fontSize: context.width(.035)),
            )),
      );
  }
}






// bottom sender widget with the icons.
class Sender extends StatelessWidget {
  const Sender({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Container(
            height: context.width(.12),
            width: context.width(.12),
            decoration: BoxDecoration(
              color: const Color(0xffF5F5F5),
              borderRadius: BorderRadius.circular(context.width(.03)),
            ),
            child: const Icon(
              Icons.add,
              color: primaryColor,
            ),
          ),
          Wspace(context.width(.02)),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(context.width(.03)),
                  hintText: "Aa",
                  suffixIcon: Icon(
                    Icons.mic_rounded,
                    color: darkGrey,
                    size: context.width(.05),
                  ),
                  fillColor: const Color(0xffF5F5F5),
                  filled: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                          Radius.circular(context.width(.03))))),
            ),
          ),
        ],
      ),
    );
  }
}
