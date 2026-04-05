import 'package:flutter_test/flutter_test.dart';
import 'package:mobintix_ui_kit_demo/main.dart';

void main() {
  testWidgets('App launches and shows home screen', (tester) async {
    await tester.pumpWidget(const UiKitExampleApp());
    await tester.pumpAndSettle();

    expect(find.text('MOBINTIX'), findsOneWidget);
    expect(find.text('UI Kit'), findsOneWidget);
    expect(find.text('Components'), findsOneWidget);
    expect(find.text('Buttons'), findsOneWidget);
  });
}
