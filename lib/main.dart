import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lassod_interview_task/cubits/signup/signup_cubit.dart';

import 'utils/constants.dart';
import 'utils/route_generator.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => SignupCubit(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Woo Dog',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: whiteColor,
          fontFamily: "Poppins"),
      initialRoute: '/',
      // builder: EasyLoading.init(),
      onGenerateRoute: RouteGenerator.generateQuote,
    );
  }
}
