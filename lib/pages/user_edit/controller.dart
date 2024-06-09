import 'package:bba/pages/user_edit/view.dart';
import 'package:bba/shared/dio.dart';
import 'package:bba/shared/states/auth.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class UserEditController extends ConsumerState<UserEditScreen> {
  final nama = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final noHP = TextEditingController();

  String? gender;

  @override
  void initState() {
    super.initState();
    nama.text = widget.user.nama;
    email.text = widget.user.email;
    noHP.text = widget.user.noHP;
    gender = widget.user.jk;
  }

  void update() async {
    final navigator = Navigator.of(context);
    final token = ref.read(authProvider)!.token;

    Map data = {
      "nama": nama.text,
      "email": email.text,
      "password": password.text,
      "jk": gender,
      "no_hp": noHP.text,
    };

    Response response = await dio(token: token).patch('/user', data: data);

    if (response.statusCode == 200) {
      ref.read(authProvider.notifier).updateUser(response.data['user']);

      navigator.pop();
    }
  }
}
