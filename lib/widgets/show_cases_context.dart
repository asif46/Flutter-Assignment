import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:showcaseview/showcaseview.dart';

import '../screens/show_cases.dart';

class ShowCasesScreen extends StatelessWidget {
  const ShowCasesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(
      onStart: (index, key) {
        log('onStart: $index, $key');
      },
      onComplete: (index, key) {
        log('onComplete: $index, $key');
        if (index == 4) {
          SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle.light.copyWith(
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: Colors.white,
            ),
          );
        }
      },
      blurValue: 1,
      builder: Builder(builder: (context) => const ShowCaseQuestion()),
      autoPlayDelay: const Duration(seconds: 3),
    );
  }
}
