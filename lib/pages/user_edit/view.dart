import 'package:bba/models/user.dart';
import 'package:bba/pages/user_edit/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserEditScreen extends ConsumerStatefulWidget {
  const UserEditScreen({super.key, required this.user});

  final User user;

  @override
  ConsumerState<UserEditScreen> createState() => _UserEditScreenState();
}

class _UserEditScreenState extends UserEditController {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 70,
              horizontal: 20,
            ),
            child: Column(
              children: [
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        "Nama Lengkap",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextFormField(
                        controller: nama,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.lightBlue.shade50.withOpacity(0.2),
                          prefixIcon: const Icon(Icons.person),
                          hintText: "Masukkan Nama",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.lightBlue,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.lightBlue,
                              width: 2,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Colors.lightBlue.shade100.withOpacity(0.5),
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Email",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextFormField(
                        controller: email,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.lightBlue.shade50.withOpacity(0.2),
                          prefixIcon: const Icon(Icons.mail),
                          hintText: "Masukkan Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.lightBlue,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.lightBlue,
                              width: 2,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Colors.lightBlue.shade100.withOpacity(0.5),
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Ganti Password",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextFormField(
                        controller: password,
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.lightBlue.shade50.withOpacity(0.2),
                          prefixIcon: const Icon(Icons.lock),
                          hintText: "Password Baru",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.lightBlue,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.lightBlue,
                              width: 2,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Colors.lightBlue.shade100.withOpacity(0.5),
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                      const Text(
                        "* Kosongkan jika tidak ingin mengganti password",
                        style: TextStyle(
                          color: Colors.grey,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Jenis Kelamin",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      DropdownButtonFormField(
                        value: gender,
                        items: ["L", "P"].map(
                          (jk) {
                            if (jk == "L") {
                              return DropdownMenuItem(
                                value: jk,
                                child: const Text("Laki-laki"),
                              );
                            } else {
                              return DropdownMenuItem(
                                value: jk,
                                child: const Text("Perempuan"),
                              );
                            }
                          },
                        ).toList(),
                        onChanged: (e) {
                          setState(() {
                            gender = e;
                          });
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.lightBlue.shade50.withOpacity(0.2),
                          prefixIcon: const Icon(Icons.male),
                          hintText: "Pilih",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.lightBlue,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.lightBlue,
                              width: 2,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Colors.lightBlue.shade100.withOpacity(0.5),
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "No. HP",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextFormField(
                        controller: noHP,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.lightBlue.shade50.withOpacity(0.2),
                          prefixIcon: const Icon(Icons.smartphone),
                          hintText: "Masukkan No. HP",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.lightBlue,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.lightBlue,
                              width: 2,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Colors.lightBlue.shade100.withOpacity(0.5),
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      FilledButton(
                        onPressed: () {
                          update();
                        },
                        child: const Text("SIMPAN"),
                      ),
                    ],
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
