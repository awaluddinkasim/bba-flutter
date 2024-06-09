import 'package:bba/auth/register/view.dart';
import 'package:bba/shared/dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class RegisterController extends State<RegisterScreen> {
  final nama = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final noHP = TextEditingController();

  String? gender;

  void register() async {
    final navigator = Navigator.of(context);

    Map data = {
      "nama": nama.text,
      "email": email.text,
      "password": password.text,
      "jk": gender,
      "no_hp": noHP.text,
    };

    Response response = await dio().post('/register', data: data);

    if (response.statusCode == 200) {
      navigator.pop();
    }
  }
}
