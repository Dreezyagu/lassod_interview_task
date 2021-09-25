// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lassod_interview_task/main.dart';
import 'package:lassod_interview_task/widgets/buttons.dart';

void main() {
  group("Widget tests", () {
    testWidgets('Sign up button test', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(MyApp());
      final button = find.byType(Button);

// checking if the custom Button widget exists in this project. Expecting at least one.
      expect(button, findsOneWidget);
    });

    testWidgets('ClipRRect test', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(MyApp());
      final clipRRect = find.byType(ClipRRect);
// checking if the ClipRRect widget exists in this project. Expecting none.
      expect(clipRRect, findsNothing);
    });
  });
}
