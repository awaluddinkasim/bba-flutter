import 'package:bba/pages/vocabulary_detail/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

abstract class VocabularyDetailController extends State<VocabularyDetailScreen> {
  FlutterTts fTts = FlutterTts();
  Map currentVoice = {};

  @override
  void initState() {
    super.initState();
    initTTS();
  }

  void initTTS() {
    fTts.getVoices.then((data) {
      List voices = List.from(data);
      voices = voices.where((voice) => voice["name"].contains("ar")).toList();

      setState(() {
        currentVoice = voices.first;
        fTts.setVoice({
          "name": currentVoice['name'],
          "locale": currentVoice['locale'],
        });
      });
    });

    fTts.getLanguages.then((data) {
      List languages = List.from(data);
      var language = languages.firstWhere((language) => language.contains("ar"));

      setState(() {
        fTts.setLanguage(language);
      });
    });
  }

  Future speak(String text) async {
    await fTts.speak(text);
  }
}
