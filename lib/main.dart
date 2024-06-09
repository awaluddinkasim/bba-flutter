import 'package:bba/auth/login/view.dart';
import 'package:bba/pages/home/view.dart';
import 'package:bba/pages/user/view.dart';
import 'package:bba/pages/search/view.dart';
import 'package:bba/shared/dio.dart';
import 'package:bba/shared/states/auth.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

const storage = FlutterSecureStorage();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  ).then(
    (value) => runApp(const ProviderScope(child: MyApp())),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Belajar Bahasa Arab',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoadingScreen(),
    );
  }
}

class LoadingScreen extends ConsumerStatefulWidget {
  const LoadingScreen({super.key});

  @override
  ConsumerState<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends ConsumerState<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    _getUser();
  }

  Future _getUser() async {
    final navigator = Navigator.of(context);
    String? token = await storage.read(key: 'token');

    if (token != null) {
      Response response = await dio(token: token).get('/user');
      if (response.statusCode == 200) {
        ref.read(authProvider.notifier).login(response.data['user'], token);
        navigator.pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const AppMain(),
          ),
          (route) => false,
        );
      } else {
        await storage.delete(key: 'token');
        navigator.pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
          (route) => false,
        );
      }
    } else {
      navigator.pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}

class AppMain extends StatefulWidget {
  const AppMain({super.key});

  @override
  State<AppMain> createState() => _AppMainState();
}

class _AppMainState extends State<AppMain> {
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      tabs: [
        PersistentTabConfig(
          screen: const HomeScreen(),
          item: ItemConfig(
            icon: const Icon(Icons.home),
            title: "Home",
          ),
        ),
        PersistentTabConfig(
          screen: const SearchScreen(),
          item: ItemConfig(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ),
        PersistentTabConfig(
          screen: const UserScreen(),
          item: ItemConfig(
            icon: const Icon(Icons.person),
            title: "User",
          ),
        ),
      ],
      navBarBuilder: (navBarConfig) => Style13BottomNavBar(
        navBarConfig: navBarConfig,
      ),
    );
  }
}
