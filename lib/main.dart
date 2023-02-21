import 'package:bills_control_flutter/pages/signup/signup_page.dart';
import 'package:bills_control_flutter/pages/splash/splash_page.dart';
import 'package:bills_control_flutter/routes.dart';
import 'package:bills_control_flutter/utils/i18n/i18n.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://emgbenelfwgvudrjsoav.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVtZ2JlbmVsZndndnVkcmpzb2F2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzY5ODgwMTUsImV4cCI6MTk5MjU2NDAxNX0.vRbqzG_QMRkfnWBwgnjqxZj983iPX2V8FwKpVQ-x-M8',
  );

  R.load(const Locale('en', 'US'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bills App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.plusJakartaSansTextTheme(),
      ),
      initialRoute: SplashPage.routeName,
      routes: routes,
    );
  }
}
