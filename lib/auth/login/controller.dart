import 'package:bba/auth/login/view.dart';
import 'package:bba/main.dart';
import 'package:bba/shared/dio.dart';
import 'package:bba/shared/states/auth.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class LoginController extends ConsumerState<LoginScreen> {
  final email = TextEditingController();
  final password = TextEditingController();

  String? error;

  void login() async {
    final navigator = Navigator.of(context);

    Map data = {
      "email": email.text,
      "password": password.text,
    };

    try {
      Response response = await dio().post('/login', data: data);

      if (response.statusCode == 200) {
        ref.read(authProvider.notifier).login(
              response.data['user'],
              response.data['token'],
            );

        navigator.pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const AppMain()),
          (route) => false,
        );
      } else {
        setState(() {
          error = response.data['message'];
        });
      }
    } on DioException catch (e) {
      if (e.response != null) {
        setState(() {
          error = e.response!.data['message'];
        });
      } else {
        setState(() {
          error = "Terjadi kesalahan";
        });
      }

      navigator.pop();
    }
  }
}
