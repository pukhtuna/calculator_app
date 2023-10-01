import 'package:calculator_app/bindings/app_bindings.dart';
import 'package:calculator_app/util/app_routes.dart';
import 'package:calculator_app/util/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final box = GetStorage();

  checkTheme() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (box.read('theme') == null) {
        await box.write('theme', 'light');
      } else if (box.read('theme') == 'light') {
        Get.changeTheme(AppTheme.lightTheme);
      } else {
        Get.changeTheme(AppTheme.darkTheme);
      }
    });
  }

  @override
  void initState() {
    checkTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator App',
      getPages: pages,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      initialBinding: AppControllerBindings(),
      initialRoute: '/splash',
    );
  }
}
