import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:grocerstore/src/pages/authentication/auth_controler.dart';
import 'package:grocerstore/src/pages_routes/app_page_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(authControlhe());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Grocer Store',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      initialRoute: PageRoutesName.SplashScreen,
      getPages: AppPageRoutes.page,
    );
  }
}
