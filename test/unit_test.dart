import 'package:flutter_test/flutter_test.dart';
import 'package:lassod_interview_task/utils/network_service.dart';

void main() {
  group("Unit tests", () {
    test("sign up function", () async {
      final signup = await NetworkService.signUp(
          fullname: "fullname", password: "password", email: "email");
      expect(signup?.statusCode, 404);
    });
  });
}
