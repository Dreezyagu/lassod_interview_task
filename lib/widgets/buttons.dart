import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lassod_interview_task/utils/constants.dart';
import 'package:lassod_interview_task/utils/extensions.dart';

// Large button widget.
class Button extends StatelessWidget {
  final String title;
  final VoidCallback function;
  final bool loading;

  const Button(
      {required this.title, required this.function, this.loading = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      margin: EdgeInsets.symmetric(horizontal: context.width(.04)),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            colors: [Color(0xffFE904B), Color(0xffFB724C)]),
        borderRadius: BorderRadius.all(Radius.circular(context.width(.05))),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: function,
          child: SizedBox(
            width: double.infinity,
            height: context.height(.07),
            child: Center(
              child: loading
                  ? const CupertinoActivityIndicator()
                  : Text(title,
                      style: TextStyle(
                          color: whiteColor,
                          fontWeight: FontWeight.w700,
                          fontSize: context.width(.05))),
            ),
          ),
        ),
      ),
    );
  }
}
