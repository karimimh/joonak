import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:joonak/main.dart';

void main() {
  testWidgets('bootstrap app renders', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: JoonakApp()));
    await tester.pumpAndSettle();
    expect(find.text('Joonak'), findsOneWidget);
  });
}
