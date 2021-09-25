import 'package:flutter_driver/flutter_driver.dart';
import 'package:lassod_interview_task/screens/home.dart';
import 'package:test/test.dart';

void main() {
  group("Sign up", () {
    final button = find.byValueKey("signupButton");
    late FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      driver.close();
    });
    test("Sign up", () async {
      await driver.tap(button);
      expect(const Home(), const Home());
    });
  });
}
