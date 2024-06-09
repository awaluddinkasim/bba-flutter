import 'package:bba/pages/materi/controller.dart';
import 'package:bba/pages/materi_detail/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class MateriScreen extends ConsumerStatefulWidget {
  const MateriScreen({super.key});

  @override
  ConsumerState<MateriScreen> createState() => _MateriScreenState();
}

class _MateriScreenState extends MateriController {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: fetchMateri,
        child: ListView(
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
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Materi Terbaru",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    if (daftarMateri.isEmpty)
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
                      for (var materi in daftarMateri)
                        Card(
                          child: Material(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                            child: InkWell(
                              onTap: () {
                                pushWithoutNavBar(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MateriDetailScreen(
                                      materi: materi,
                                    ),
                                  ),
                                );
                              },
                              borderRadius: BorderRadius.circular(12),
                              child: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 22,
                                        horizontal: 22,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.lightBlue,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: const Icon(
                                        Icons.play_arrow,
                                        color: Colors.white,
                                        size: 40,
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
                                            "${materi['judul']}",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                          Text(
                                            "${materi['excerpt']}",
                                            style: const TextStyle(color: Colors.grey),
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
              ),
          ],
        ),
      ),
    );
  }
}
