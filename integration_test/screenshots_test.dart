import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mobintix_ui_kit_demo/main.dart' as app;

/// Captures PNGs on a physical device or emulator for pub.dev (mobile surface).
///
/// Run (writes PNGs on your **Mac/PC** under `build/pub_screenshots/`):
///   flutter drive \
///     --driver=test_driver/pub_screenshots_driver.dart \
///     --target=integration_test/screenshots_test.dart \
///     -d `your_device_id`
///
/// **Host output:** use `flutter drive` with [test_driver/pub_screenshots_driver.dart].
/// That writes PNGs under `build/pub_screenshots/`. Copy them into the private kit’s
/// `screenshots/` folder for pub.dev.
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('pub.dev screenshots (mobile)', (tester) async {
    final binding = IntegrationTestWidgetsFlutterBinding.instance;

    Future<void> pumpFrames(WidgetTester t, {int iterations = 30}) async {
      for (var i = 0; i < iterations; i++) {
        await t.pump(const Duration(milliseconds: 50));
      }
    }

    app.main();
    // Avoid unbounded pumpAndSettle — the showcase may include ongoing animations.
    await pumpFrames(tester, iterations: 80);

    if (Platform.isAndroid) {
      await binding.convertFlutterSurfaceToImage();
      await pumpFrames(tester);
    }

    Future<void> capture(String baseName) async {
      await pumpFrames(tester, iterations: 12);
      await binding.takeScreenshot(baseName);
    }

    await capture('home');

    Finder homeScrollable() {
      final views = find.byType(CustomScrollView);
      if (views.evaluate().isNotEmpty) {
        return find.descendant(
          of: views.first,
          matching: find.byType(Scrollable),
        );
      }
      return find.byType(Scrollable);
    }

    Future<void> goToCategory(String title) async {
      await tester.scrollUntilVisible(
        find.text(title),
        200,
        scrollable: homeScrollable(),
      );
      await pumpFrames(tester);
      await tester.tap(find.text(title).first);
      await pumpFrames(tester, iterations: 60);
    }

    Future<void> captureCategory(String title, String fileBase) async {
      await goToCategory(title);
      await capture(fileBase);
      await tester.pageBack();
      await pumpFrames(tester, iterations: 60);
    }

    await captureCategory('Buttons', 'buttons');
    await captureCategory('Inputs', 'inputs');
    await captureCategory('Cards', 'cards');
    await captureCategory('Dialogs & Sheets', 'dialogs');
    await captureCategory('Feedback', 'feedback');
    await captureCategory('Media', 'media');
    await captureCategory('Typography', 'typography');
    await captureCategory('Layout & Grid', 'layout');
    await captureCategory('Misc', 'misc');
    await captureCategory('Theme Tokens', 'theme');
  });
}
