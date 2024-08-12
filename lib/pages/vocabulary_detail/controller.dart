import 'package:bba/pages/vocabulary_detail/view.dart';
import 'package:bba/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:just_audio/just_audio.dart';

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

  Future play(String filename) async {
    final player = AudioPlayer();
    await player.setUrl("${Constants.baseURL}/vocabulary/$filename");
    await player.play();
    await player.stop();
  }

  Future speak(String text) async {
    await fTts.speak(text);
  }
}
