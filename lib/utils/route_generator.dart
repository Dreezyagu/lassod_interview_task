import 'package:flutter/material.dart';
import 'package:lassod_interview_task/screens/home.dart';
import 'package:lassod_interview_task/screens/onboarding.dart';
import 'package:lassod_interview_task/screens/signup.dart';
import 'package:lassod_interview_task/screens/walker_details.dart';

// Navigation between screens using RouteGenerator.
class RouteGenerator {
  static Route<dynamic> generateQuote(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => const Onboarding());
      case "/signup":
        return MaterialPageRoute(builder: (_) => const Signup());
      case "/home":
        return MaterialPageRoute(builder: (_) => const Home());
      case "/walker_details":
        return MaterialPageRoute(builder: (_) => const WalkerDetails());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text("Error"),
            ),
          );
        });
    }
  }
}
