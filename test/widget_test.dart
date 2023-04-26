// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:ipaper/main.dart';
import 'package:patrol/patrol.dart';

void main() {
  // patrolTest('signs up', ($) async {
  //   await $.pumpWidgetAndSettle(const MyApp());

  //   expect($('Flutter Demo Home Page'), findsOneWidget);
  // });

  patrolTest(
    'counter state is the same after going to home and switching apps 2',
    ($) async {
      // Replace with your own app widget.
      await $.pumpWidgetAndSettle(const MyApp());
      await $('Alles akzeptieren').waitUntilVisible().tap();

      expect(await $('/').waitUntilVisible(), findsOneWidget);
    },
  );
}
