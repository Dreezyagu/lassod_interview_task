import 'package:http/http.dart';

class NetworkService {

  // sign up simulation api call.
  static Future<Response?> signUp(
      {required String fullname,
      required String password,
      required String email}) async {
    try {
      final url = Uri.parse("https://hookb.in/mZZ8pmBdk6ilzXNNzQGp");
      final body = {"email": email, "password": password, "fullname": fullname};
      final response =
          await post(url, body: body).timeout(const Duration(seconds: 5));

      return response;
    } catch (e) {
      return null;
    }
  }
}
