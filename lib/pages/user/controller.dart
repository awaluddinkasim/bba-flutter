import 'package:bba/auth/login/view.dart';
import 'package:bba/pages/user/view.dart';
import 'package:bba/shared/dio.dart';
import 'package:bba/shared/states/auth.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class UserController extends ConsumerState<UserScreen> {
  void logout() async {
    final navigator = Navigator.of(context, rootNavigator: true);
    final token = ref.read(authProvider)!.token;

    try {
      Response response = await dio(token: token).post("/logout");

      if (response.statusCode == 200) {
        ref.read(authProvider.notifier).logout();

        navigator.pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
          (route) => false,
        );
      }
    } on DioException catch (_) {
      navigator.pop();
    }
  }
}
