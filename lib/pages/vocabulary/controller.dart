import 'package:bba/pages/vocabulary/view.dart';
import 'package:bba/shared/dio.dart';
import 'package:bba/shared/states/auth.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class VocabularyController extends ConsumerState<VocabularyScreen> {
  List vocabularies = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchVocabularies();
  }

  void fetchVocabularies() async {
    final token = ref.read(authProvider)!.token;

    Response response = await dio(token: token).get('/kosakata?filter=${widget.filter}');

    if (response.statusCode == 200) {
      setState(() {
        vocabularies = response.data['vocabularies'];
        isLoading = false;
      });
    }
  }
}
