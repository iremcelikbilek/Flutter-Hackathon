import 'dart:convert';
import 'package:http/http.dart' as http;

class UserServices {
  Future<Map> signUp(Map body) async {
    final http.Response response =
        await http.post('https://flutterappserver.herokuapp.com/users/signup',
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(body));
    if (response.statusCode == 200) {
      return (jsonDecode(response.body));
    } else {
      throw Exception('Failed signUp.');
    }
  }

  Future<Map> signIn(String mail, String password) async {
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$mail:$password'));
    final http.Response response = await http.post(
        'https://flutterappserver.herokuapp.com/users/signin',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'authorization': basicAuth
        });
    if (response.statusCode == 200) {
      return (jsonDecode(response.body));
    } else {
      throw Exception('Failed signIn.');
    }
  }
}
