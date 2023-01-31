import 'package:colette/screens/activities/activities.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:colette/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('end-to-end test', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Find the login button
      var logInButton = find.text('Log in');

      // Verify that the app starts with the auth
      expect(logInButton, findsOneWidget);

      // Tap the login button
      await tester.tap(logInButton);
      await tester.pumpAndSettle();

      var firstTile = find.text(activities.first.title);

      // Verify that the activities list shows
      expect(firstTile, findsOneWidget);

      // Tap the first tile
      await tester.tap(firstTile);
      await tester.pumpAndSettle();

      // Verify that the details are shown
      expect(find.text(activities.first.description), findsOneWidget);

      // Find the register button
      var registerButton = find.text("Register");

      // Tap the first tile
      await tester.tap(registerButton);
      await tester.pumpAndSettle();

      // Find the unregister button
      var unregisterButton = find.text("Unregister");

      // Verify that the button changed
      expect(unregisterButton, findsOneWidget);
    });
  });
}
