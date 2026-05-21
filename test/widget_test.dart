// Basic smoke test that verifies the app builds without crashing.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:agrisnap/main.dart';

void main() {
  testWidgets('AgriSnapApp builds without crashing', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const AgriSnapApp());
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
