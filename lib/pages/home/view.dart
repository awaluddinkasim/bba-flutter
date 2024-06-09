import 'package:bba/pages/materi/view.dart';
import 'package:bba/pages/percakapan/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Stack(
                      children: [
                        Container(
                          transform: Matrix4.translationValues(0, 50, 0),
                          alignment: AlignmentDirectional.bottomEnd,
                          height: 200,
                          child: SvgPicture.asset(
                            "assets/welcome.svg",
                            fit: BoxFit.cover,
                            height: 280,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 25,
                            horizontal: 15,
                          ),
                          child: Text(
                            "Selamat Datang!",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Pilihan Menu",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ),
                Card(
                  child: Material(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        pushWithoutNavBar(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MateriScreen(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Colors.lightBlueAccent,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: OverflowBox(
                                maxHeight: 250,
                                maxWidth: double.infinity,
                                child: Transform.translate(
                                  offset: const Offset(0, 30),
                                  child: SvgPicture.asset(
                                    "assets/learning.svg",
                                    width: 220,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  const Text(
                                    "Materi",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    "Belajar bahasa Arab dengan materi yang disediakan",
                                    style: TextStyle(color: Colors.grey.shade700),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(Icons.chevron_right),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Card(
                  child: Material(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        pushWithoutNavBar(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PercakapanHarianScreen(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Colors.lightBlueAccent,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: OverflowBox(
                                maxHeight: 250,
                                maxWidth: double.infinity,
                                child: Transform.translate(
                                  offset: const Offset(10, 40),
                                  child: SvgPicture.asset(
                                    "assets/talk.svg",
                                    width: 250,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  const Text(
                                    "Kalimat Sehari-hari",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    "Contoh penggunaan bahasa Arab dalam kehidupan sehari-hari",
                                    style: TextStyle(color: Colors.grey.shade700),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(Icons.chevron_right),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
