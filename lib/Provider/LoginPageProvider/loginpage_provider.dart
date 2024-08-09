import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginpageProvider extends ChangeNotifier {
  bool _isVisible = false;

  final TextEditingController _userNameControll = TextEditingController();
  final TextEditingController _userPassControll = TextEditingController();

  TextEditingController get userNameControll => _userNameControll;
  TextEditingController get userPassControll => _userPassControll;
  bool get isVisible => _isVisible;

  void togglerbutton() {
    _isVisible = !_isVisible;
    notifyListeners();
  }

  Future<bool> postData() async {
    final url = Uri.parse('https://example.com/api/login');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      'username': _userNameControll.text,
      'password': _userPassControll.text,
    });

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print('Login successful: $data');
        return true;
      } else {
        final errorData = jsonDecode(response.body);
        print('Error: ${errorData['message']}');
        return false;
      }
    } catch (e) {
      print('An error occurred: $e');
      return false;
    }
  }
}
