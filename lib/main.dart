import 'package:flutter/material.dart';
import 'package:whatsapp_ui/colors.dart';
import 'package:whatsapp_ui/responsive/responsive_layout.dart';
import 'package:whatsapp_ui/screens/desktop_layout.dart';
import 'package:whatsapp_ui/screens/mobile_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title:'whatsapp ui',
      theme: ThemeData.dark().copyWith(
         scaffoldBackgroundColor: backgroundColor,
      ),
      home: const ResponsiveLayout(mobilelayout: MobileLayout(), desktoplayout: DesktopLayout()),

    );
  }
}