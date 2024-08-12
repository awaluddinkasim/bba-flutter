import 'package:bba/pages/percakapan_detail/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PercakapanHarianDetailScreen extends StatefulWidget {
  const PercakapanHarianDetailScreen({super.key, required this.percakapan});

  final Map percakapan;

  @override
  State<PercakapanHarianDetailScreen> createState() => _PercakapanHarianDetailScreenState();
}

class _PercakapanHarianDetailScreenState extends PercakapanHarianDetailController {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 50,
          ),
          SvgPicture.asset(
            "assets/conversation.svg",
            height: 300,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Text(
                  "${widget.percakapan['arab']}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 24),
                ),
                Text(
                  "${widget.percakapan['latin']}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey.shade700,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "${widget.percakapan['kalimat']}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                FilledButton.icon(
                  onPressed: () {
                    play("${widget.percakapan['audio']}");
                  },
                  icon: const Icon(Icons.volume_up),
                  label: const Text("Putar Suara"),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
