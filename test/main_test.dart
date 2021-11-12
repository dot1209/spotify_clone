import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:spotify_clone/main.dart';

Widget createMyApp() => const MyApp();

void main() {
  group('MyApp Tests', () {
    testWidgets('Testing Bottom Navigation Bar', (tester) async {
      await tester.pumpWidget(createMyApp());

      await tester.tap(find.byIcon(Icons.search));
      await tester.pumpAndSettle();
      expect(find.text('Search Page'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.library_music));
      await tester.pumpAndSettle();
      expect(find.text('Library Page'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.person));
      await tester.pumpAndSettle();
      expect(find.text('Premium Page'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.home_filled));
      await tester.pumpAndSettle();
      expect(find.text('Home Page'), findsOneWidget);
    });
  });
}
