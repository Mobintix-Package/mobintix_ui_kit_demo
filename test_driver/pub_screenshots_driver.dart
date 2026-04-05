import 'dart:io';

import 'package:integration_test/integration_test_driver_extended.dart';

/// Host-side driver: writes PNGs from the device integration test to disk.
///
/// Run (Android phone / emulator — not web):
///   flutter drive \
///     --driver=test_driver/pub_screenshots_driver.dart \
///     --target=integration_test/screenshots_test.dart \
///     -d `your_device_id`
Future<void> main() => integrationDriver(
      onScreenshot: (String name, List<int> bytes,
          [Map<String, Object?>? args]) async {
        final dir = Directory('build/pub_screenshots');
        await dir.create(recursive: true);
        final fileName = name.endsWith('.png') ? name : '$name.png';
        await File('${dir.path}/$fileName').writeAsBytes(bytes, flush: true);
        return true;
      },
    );
