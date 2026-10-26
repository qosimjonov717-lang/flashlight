import 'package:flutter_test/flutter_test.dart';
import 'package:flashlight/main.dart';

void main() {
  testWidgets('Flashlight app test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const FlashlightApp(),
    );

    // Ilova nomi chiqayotganini tekshiramiz
    expect(find.text('Flashlight'), findsOneWidget);

    // Boshlang'ich holatda fonar o'chiq bo'lishi kerak
    expect(find.text('Chiroq o‘chiq'), findsOneWidget);

    // Fonarni yoqish haqida yozuv
    expect(
      find.text('Chiroqni yoqish uchun tugmani bosing'),
      findsOneWidget,
    );

    // Maslahat borligini tekshiramiz
    expect(find.text('Maslahat'), findsOneWidget);
  });
}