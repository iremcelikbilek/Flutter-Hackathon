import 'dart:convert';
import 'package:http/http.dart' as http;

class UserServices {
  Future<Map> signUp(Map body) async {
    print(body.toString());
    final http.Response response =
        await http.post('https://flutterappserver.herokuapp.com/users/signup',
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(body));
    print(response.body);
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return (jsonDecode(response.body));
    } else {
      throw Exception('Failed signUp.');
    }
  }

  Future<Map> signIn(String mail, String password) async {
    print("mail $mail password $password");
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$mail:$password'));
    final http.Response response = await http.post(
        'https://flutterappserver.herokuapp.com/users/login',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'authorization': basicAuth
        });
    print("response $response : ${response.body}: ${response.statusCode}");
    if (response.statusCode == 200) {
      print("sign in servis ${jsonDecode(response.body)}");
      return (jsonDecode(response.body));
    } else {
      throw Exception('Failed signIn.');
    }
  }
}
