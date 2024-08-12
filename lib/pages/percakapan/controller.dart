import 'package:bba/pages/percakapan/view.dart';
import 'package:bba/shared/dio.dart';
import 'package:bba/shared/states/auth.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class PercakapanHarianController extends ConsumerState<PercakapanHarianScreen> {
  List daftarPercakapan = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchPercakapan();
  }

  Future fetchPercakapan() async {
    Response response = await dio().get('/percakapan-harian');

    print(response);

    if (response.statusCode == 200) {
      setState(() {
        daftarPercakapan = response.data['daftarPercakapan'];
        isLoading = false;
      });
    }
  }
}
