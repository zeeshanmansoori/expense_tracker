import 'dart:io';

import 'package:expense_tracker/screens/bottom_navigation_screen/bottom_navigation_screen.dart';
import 'package:expense_tracker/screens/make_payment/make_payment_screen.dart';
import 'package:expense_tracker/screens/scanner/scanner_screen.dart';
import 'package:expense_tracker/utils/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      const SystemUiOverlayStyle systemUiOverlayStyle =
          SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Inter',
        primaryColor: CustomColors.primaryColor,
        inputDecorationTheme: InputDecorationTheme(
          // errorBorder: getOutlinedBorder(CustomColors.errorColor),
          // focusedErrorBorder: getOutlinedBorder(CustomColors.errorColor),
          enabledBorder: getOutlinedBorder(Colors.black12),
          focusedBorder: getOutlinedBorder(CustomColors.primaryColor),
          filled: true,
          fillColor: Colors.white,
          // counterStyle: const TextStyle(color: CustomColors.errorColor),
          // hintStyle: defaultTextStyle().copyWith(color: CustomColors.hintColor),
          isDense: true,
        ),
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: CustomColors.primaryMaterialColor,
      ),
      home: const Scaffold(
        body: BottomNavigationScreen(),
        // body: MakePaymentScreen(),
      ),
      routes: {
        MakePaymentScreen.routeName: (ctx) => const MakePaymentScreen(),
        ScannerScreen.routeName: (ctx) => const ScannerScreen(),
      },
    );
  }

  OutlineInputBorder getOutlinedBorder(Color color, {double width = 1}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
        width: width,
      ),
    );
  }
}
