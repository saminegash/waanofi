
import 'package:flutter_test/flutter_test.dart';
import 'package:waanofi/main.dart';

void main() {
  testWidgets('WaanofiApp renders', (WidgetTester tester) async {
    await tester.pumpWidget(const WaanofiApp());
    // Verify the app title is rendered in the widget tree.
    expect(find.text('Waanofi Dairy'), findsOneWidget);
  });
}
