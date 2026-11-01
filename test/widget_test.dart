import 'package:flutter_test/flutter_test.dart';
import 'package:plusone/main.dart';

void main() {
  testWidgets('Login screen renders', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pump();

    expect(find.text('Войти'), findsOneWidget);
    expect(find.text('С возвращением'), findsOneWidget);
  });
}
