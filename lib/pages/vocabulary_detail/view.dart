import 'package:bba/pages/vocabulary_detail/controller.dart';
import 'package:flutter/material.dart';

class VocabularyDetailScreen extends StatefulWidget {
  const VocabularyDetailScreen({super.key, required this.vocabulary});

  final Map vocabulary;

  @override
  State<VocabularyDetailScreen> createState() => _VocabularyDetailScreenState();
}

class _VocabularyDetailScreenState extends VocabularyDetailController {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "${widget.vocabulary['arti']}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${widget.vocabulary['kata']}",
                            style: const TextStyle(
                              fontSize: 34,
                            ),
                          ),
                          Text(
                            "${widget.vocabulary['latin']}",
                            style: const TextStyle(
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),
                    FilledButton(
                      onPressed: () {
                        play("${widget.vocabulary['audio']}");
                      },
                      child: const Icon(Icons.volume_up),
                    ),
                  ],
                ),
                const Divider(
                  height: 50,
                ),
                const Text(
                  "Contoh Kalimat",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "${widget.vocabulary['contoh_kalimat']}",
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
