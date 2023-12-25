import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:grocerstore/src/pages/authentication/sing_in.dart';
import 'package:grocerstore/src/pages/splash_page/splashe_page.dart';
import 'package:grocerstore/src/pages_routes/app_page_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
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
