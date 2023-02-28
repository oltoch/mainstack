import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mainstack/controllers/editor_controller.dart';
import 'package:mainstack/controllers/theme_controller.dart';
import 'package:mainstack/views/editor_main_view.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MainStack',
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ).apply(fontSizeFactor: 1.sp, bodyColor: Colors.black),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        builder: (context, widget) {
          Get.put(ThemeController());
          Get.put(EditorController());
          SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
          return widget!;
        },
        home: const EditorMainView(),
      ),
    );
  }
}
