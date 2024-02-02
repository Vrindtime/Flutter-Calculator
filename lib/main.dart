import 'package:calculator/responsive/desktop_body.dart';
import 'package:calculator/responsive/mobile_body.dart';
import 'package:calculator/responsive/responsive_layout.dart';
import 'package:calculator/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculator",
      home: ResponsiveLayout(
        mobileBody: mobileBody(),
        desktopBody: desktopBody(),
      ),
      theme: lightmode,
      darkTheme: darkmode,
    );
  }
}
