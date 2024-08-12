import 'package:bba/pages/materi/view.dart';
import 'package:bba/shared/dio.dart';
import 'package:bba/shared/states/auth.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class MateriController extends ConsumerState<MateriScreen> {
  List daftarMateri = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchMateri();
  }

  Future fetchMateri() async {
    Response response = await dio().get("/materi");

    if (response.statusCode == 200) {
      setState(() {
        daftarMateri = response.data['daftarMateri'];
        isLoading = false;
      });
    }
  }
}
