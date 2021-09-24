import 'package:flutter/material.dart';
import 'package:lassod_interview_task/utils/constants.dart';
import 'package:lassod_interview_task/utils/extensions.dart';

class WalkerDetails extends StatefulWidget {
  const WalkerDetails({Key? key}) : super(key: key);

  @override
  _WalkerDetailsState createState() => _WalkerDetailsState();
}

class _WalkerDetailsState extends State<WalkerDetails> {
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
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
