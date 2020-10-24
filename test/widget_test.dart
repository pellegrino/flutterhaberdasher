// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutterhaberdasher/main.dart';
import 'package:flutterhaberdasher/model/model.dart';
import 'package:flutterhaberdasher/pages/pages.dart';
import 'package:flutterhaberdasher/widgets/message_display.dart';
import 'package:flutterhaberdasher/widgets/widgets.dart';
import 'package:mockito/mockito.dart';
import 'package:twirp_dart_core/twirp_dart_core.dart';

class MockHaberdasherClient extends Mock implements Haberdasher {}

void main() {
  MockHaberdasherClient mockHaberdasherClient = MockHaberdasherClient();
  testWidgets('Creates a hat and displays it', (WidgetTester tester) async {
    when(mockHaberdasherClient.makeHat(any))
        .thenAnswer((_) async => Hat(1, 'red', 'bowler'));
    // Build our app and trigger a frame.
    await tester.pumpWidget(HaberdasherApp(
      haberdasherClient: mockHaberdasherClient,
    ));

    await tester.enterText(find.byType(TextField), '1');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();

    verify(mockHaberdasherClient.makeHat(any)).called(1);

    expect(find.byKey(HaberdasherUIKeys.hatLoadedKey), findsOneWidget);
  });

  testWidgets('Displays an error when it cannot create the hat',
      (WidgetTester tester) async {
    when(mockHaberdasherClient.makeHat(any))
        .thenThrow(TwirpException('wrong size'));
    // Build our app and trigger a frame.
    await tester.pumpWidget(HaberdasherApp(
      haberdasherClient: mockHaberdasherClient,
    ));

    await tester.enterText(find.byType(TextField), '0');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();

    expect(find.byKey(HaberdasherUIKeys.hatErrorKey), findsOneWidget);
  });
}
