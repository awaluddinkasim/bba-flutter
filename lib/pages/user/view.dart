import 'package:bba/models/user.dart';
import 'package:bba/pages/about/view.dart';
import 'package:bba/pages/user/controller.dart';
import 'package:bba/pages/user_edit/view.dart';
import 'package:bba/shared/states/auth.dart';
import 'package:bba/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class UserScreen extends ConsumerStatefulWidget {
  const UserScreen({super.key});

  @override
  ConsumerState<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends UserController {
  @override
  Widget build(BuildContext context) {
    User user = ref.read(authProvider)!.user;

    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                transform: Matrix4.translationValues(
                  0,
                  -MediaQuery.of(context).viewPadding.top,
                  0,
                ),
                height: 320,
                decoration: const BoxDecoration(
                  color: Colors.lightBlue,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 120,
                  ),
                  Center(
                    child: SvgPicture.asset(
                      "assets/avatar.svg",
                      width: 200,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    user.nama,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    user.email,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          ListTile(
            onTap: () {
              pushScreenWithoutNavBar(
                context,
                UserEditScreen(
                  user: user,
                ),
              ).then((_) {
                setState(() {});
              });
            },
            leading: const Icon(Icons.edit_document),
            title: const Text("Edit Akun"),
            trailing: const Icon(Icons.chevron_right),
          ),
          ListTile(
            onTap: () {
              pushScreenWithoutNavBar(
                context,
                const AboutScreen(),
              );
            },
            leading: const Icon(Icons.info_outline),
            title: const Text("Tentang"),
            trailing: const Icon(Icons.chevron_right),
          ),
          ListTile(
            onTap: () {
              loading(context);
              logout();
            },
            leading: const Icon(Icons.logout),
            title: const Text("Logout"),
          ),
        ],
      ),
    );
  }
}
