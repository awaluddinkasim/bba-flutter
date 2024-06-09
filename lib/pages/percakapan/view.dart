import 'package:bba/pages/percakapan/controller.dart';
import 'package:bba/pages/percakapan_detail/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class PercakapanHarianScreen extends ConsumerStatefulWidget {
  const PercakapanHarianScreen({super.key});

  @override
  ConsumerState<PercakapanHarianScreen> createState() => _PercakapanHarianScreenState();
}

class _PercakapanHarianScreenState extends PercakapanHarianController {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: fetchPercakapan,
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
                    if (daftarPercakapan.isEmpty)
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
                      for (var percakapan in daftarPercakapan)
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
                                    builder: (context) => PercakapanHarianDetailScreen(
                                      percakapan: percakapan,
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
                                        CupertinoIcons.chat_bubble_fill,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Expanded(
                                      child: Text(
                                        "\"${percakapan['kalimat']}\"",
                                        style: const TextStyle(fontSize: 16),
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
      ),
    );
  }
}
