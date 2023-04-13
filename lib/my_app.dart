import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hypertension/app/routes/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Hyper Tension',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xffF6F6F6),
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      getPages: AppRoutes.appRoutes(),
    );
  }
}
