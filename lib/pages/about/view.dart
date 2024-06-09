import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 30,
              horizontal: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Tentang",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Aplikasi Belajar Bahasa Arab ini dirancang untuk membantu Anda mempelajari bahasa Arab dengan mudah dan menyenangkan. Aplikasi ini menyediakan berbagai fitur yang akan memudahkan Anda dalam mempelajari kosakata, percakapan sehari-hari, serta materi pembelajaran lainnya.",
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  "Fitur Utama",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Table(
                  columnWidths: const {
                    0: FixedColumnWidth(25),
                  },
                  children: const [
                    TableRow(children: [
                      TableCell(
                        child: Text("1"),
                      ),
                      TableCell(
                        child: Text(
                            "Text to Speech. Dengan fitur ini, Anda dapat mendengarkan pelafalan kosakata dan percakapan dalam bahasa Arab dengan benar. Hal ini sangat membantu dalam mempelajari pengucapan yang tepat."),
                      ),
                    ]),
                    TableRow(children: [
                      TableCell(
                        child: Text("2"),
                      ),
                      TableCell(
                        child: Text(
                            "Kosakata dan Percakapan Sehari-hari. Aplikasi ini menyediakan kumpulan kosakata dan contoh percakapan sehari-hari yang sering digunakan dalam bahasa Arab. Dengan mempelajari kosakata dan percakapan ini, Anda akan lebih mudah dalam berkomunikasi menggunakan bahasa Arab."),
                      ),
                    ]),
                    TableRow(children: [
                      TableCell(
                        child: Text("3"),
                      ),
                      TableCell(
                        child: Text(
                            "Materi Pembelajaran. Materi ini diunggah oleh admin melalui web, sehingga Anda akan selalu mendapatkan materi terbaru. Materi pembelajaran disertai dengan video yang dapat Anda akses langsung melalui aplikasi."),
                      ),
                    ])
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  "Pengembang",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const Text(
                  "Ahmad Naufal Al Qadri",
                ),
                const SizedBox(
                  height: 55,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
