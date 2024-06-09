import 'package:bba/pages/vocabulary/controller.dart';
import 'package:bba/pages/vocabulary_detail/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class VocabularyScreen extends ConsumerStatefulWidget {
  const VocabularyScreen({super.key, required this.filter});

  final String filter;

  @override
  ConsumerState<VocabularyScreen> createState() => _VocabularyScreenState();
}

class _VocabularyScreenState extends VocabularyController {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          if (isLoading)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 50),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                    ),
                    child: Wrap(
                      children: [
                        const Text(
                          "Menampilkan semua hasil dengan kata kunci ",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "\"${widget.filter}\"",
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  if (vocabularies.isEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50),
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            "assets/empty.svg",
                            height: 320,
                          ),
                          const Text(
                            "Tidak ada data ditemukan",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    )
                  else
                    for (var vocabulary in vocabularies)
                      Card(
                        child: Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12),
                            onTap: () {
                              pushWithoutNavBar(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => VocabularyDetailScreen(
                                    vocabulary: vocabulary,
                                  ),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 12,
                                      horizontal: 12,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.lightBlue,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: const Icon(
                                      Icons.volume_up,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        Text(
                                          "${vocabulary['arti']}",
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                        Text(
                                          "${vocabulary['latin']}",
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.black54,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
