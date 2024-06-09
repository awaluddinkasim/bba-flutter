import 'package:bba/pages/materi_detail/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class MateriDetailScreen extends StatefulWidget {
  const MateriDetailScreen({super.key, required this.materi});

  final Map materi;

  @override
  State<MateriDetailScreen> createState() => _MateriDetailScreenState();
}

class _MateriDetailScreenState extends MateriDetailController {
  @override
  Widget build(BuildContext context) {
    return YoutubePlayerScaffold(
        backgroundColor: Colors.black,
        builder: (context, player) {
          return Scaffold(
            body: ListView(
              children: [
                player,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      color: Colors.grey.shade300,
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "${widget.materi['judul']}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            "${widget.materi['timestamp']}",
                            style: TextStyle(
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 18),
                      child: HtmlWidget("${widget.materi['konten']}"),
                    )
                  ],
                ),
              ],
            ),
          );
        },
        controller: controller);
  }
}
