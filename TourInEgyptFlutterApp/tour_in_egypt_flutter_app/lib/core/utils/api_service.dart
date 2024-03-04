import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  // localhost
  // static String baseUrl = 'http://10.0.2.2:3000/';
  // static String imagesBaseUrl = 'http://192.168.1.5:3000/';

  // Depoly
  static String baseUrl = 'https://clean-gray-springbok.cyclic.app/';
  static String imagesBaseUrl = 'https://clean-gray-springbok.cyclic.app/';

  static Future<Map<String, dynamic>> signIn(
      {required String email, required String password}) async {
    Uri url = Uri.parse('${baseUrl}users/signIn');
    http.Response response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    );
    Map<String, dynamic> data = jsonDecode(response.body);
    return data;
  }

  static Future<Map<String, dynamic>> signUp(
      {required String username,
      required String email,
      required String password}) async {
    Uri url = Uri.parse('${baseUrl}users/signUp');
    http.Response response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "username": username,
        "email": email,
        "password": password,
      }),
    );
    Map<String, dynamic> data = jsonDecode(response.body);
    return data;
  }

  static Future<Map<String, dynamic>> sendConfirmationCode(
      {required String email}) async {
    Uri url = Uri.parse('${baseUrl}users/sendConfirmationCode');
    http.Response response = await http.put(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "email": email,
      }),
    );
    Map<String, dynamic> data = jsonDecode(response.body);
    return data;
  }

  static Future<Map<String, dynamic>> verifyConfirmationCode(
      {required String email, required String confirmationCode}) async {
    Uri url = Uri.parse('${baseUrl}users/verifyConfirmationCode');
    http.Response response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({"email": email, "confirmationCode": confirmationCode}),
    );
    Map<String, dynamic> data = jsonDecode(response.body);
    return data;
  }

  static Future<Map<String, dynamic>> updatePassword(
      {required String email, required String newPassword}) async {
    Uri url = Uri.parse('${baseUrl}users/updatePassword');
    http.Response response = await http.put(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({"email": email, "newPassword": newPassword}),
    );
    Map<String, dynamic> data = jsonDecode(response.body);
    return data;
  }

  static Future<Map<String, dynamic>> getAllUsers(
      {required String token}) async {
    Uri url = Uri.parse('${baseUrl}users/getAllUsers');
    http.Response response = await http.get(
      url,
      headers: {
        "token": token,
      },
    );
    Map<String, dynamic> data = jsonDecode(response.body);
    return data;
  }

  static Future<Map<String, dynamic>> getAllPosts(
      {required String token}) async {
    Uri url = Uri.parse('${baseUrl}posts/getAllPosts');
    http.Response response = await http.get(
      url,
      headers: {
        "token": token,
      },
    );
    Map<String, dynamic> data = jsonDecode(response.body);
    return data;
  }

  static Future<Map<String, dynamic>> getCities(
      {required String token}) async {
    Uri url = Uri.parse('${baseUrl}cities/getCities');
    http.Response response = await http.get(
      url,
      headers: {
        "token": token,
      },
    );
    Map<String, dynamic> data = jsonDecode(response.body);
    return data;
  }
}
