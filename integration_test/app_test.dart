// ignore_for_file: avoid_print
import 'package:flutter_test/flutter_test.dart';
import 'package:ipaper/main.dart';
import 'package:patrol/patrol.dart';

import 'config.dart';

// This is an example integration test using Patrol. Use it as a base to
// create your own Patrol-powered test.
//
// To run it, you have to use `patrol drive` instead of `flutter test`.

void main() {
  // patrolTest(
  //   'counter state is the same after going to home and switching apps',
  //   config: patrolConfig,
  //   nativeAutomation: true,
  //   ($) async {
  //     // Replace with your own app widget.
  //     await $.pumpWidgetAndSettle(const MyApp());

  //     expect($('Flutter Demo Home Page'), findsOneWidget);
  //   },
  // );

  patrolTest(
    'Accept cookies and go to next screen',
    config: patrolConfig,
    nativeAutomation: true,
    ($) async {
      // Replace with your own app widget.
      await $.pumpWidgetAndSettle(const MyApp());
      await Future<void>.delayed(const Duration(seconds: 3));
      await $.native.waitAndTap($, Selector(text: 'Alles akzeptieren'));
      await $.native.waitAndEnterTextByIndex(
        $,
        Selector(text: '1 / 68'),
        text: '2',
        index: 0,
      );

      await $.native.waitAndTap($, Selector(text: 'return'));
    },
  );
}

extension PatrolX on NativeAutomator {
  Future<void> waitAndTap(PatrolTester $, Selector selector) async {
    await tap(selector, appId: resolvedAppId);
    await $.pumpAndSettle();
  }

  Future<void> waitAndEnterText(
    PatrolTester $,
    Selector selector, {
    required String text,
  }) async {
    await enterText(selector, text: text, appId: resolvedAppId);
    await $.pumpAndSettle();
  }

  Future<void> waitAndEnterTextByIndex(
    PatrolTester $,
    Selector selector, {
    required String text,
    required int index,
  }) async {
    await enterTextByIndex(text, index: index, appId: resolvedAppId);
    await $.pumpAndSettle();
  }
}
