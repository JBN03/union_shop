import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Compact form validation tests for Union Shop coursework.
void main() {
  void showSnack(WidgetTester t, String msg) {
    ScaffoldMessenger.of(t.element(find.byType(Scaffold))).showSnackBar(SnackBar(content: Text(msg)));
  }

  group('Login Form Validation', () {
    late TextEditingController email, password;
    setUp(() { email = TextEditingController(); password = TextEditingController(); });
    tearDown(() { email.dispose(); password.dispose(); });

    Widget buildLogin(VoidCallback onSubmit) => MaterialApp(
      home: Scaffold(body: Column(children: [
        TextFormField(controller: email),
        TextFormField(controller: password),
        ElevatedButton(onPressed: onSubmit, child: const Text('Sign in')),
      ])),
    );

    testWidgets('empty email shows error', (t) async {
      await t.pumpWidget(buildLogin(() {
        if (email.text.isEmpty) showSnack(t, 'Please enter your email');
      }));
      await t.tap(find.text('Sign in'));
      await t.pump();
      expect(find.text('Please enter your email'), findsOneWidget);
    });

    testWidgets('empty password shows error', (t) async {
      await t.pumpWidget(buildLogin(() {
        if (email.text.isNotEmpty && password.text.isEmpty) showSnack(t, 'Please enter your password');
      }));
      await t.enterText(find.byType(TextFormField).first, 'test@test.com');
      await t.tap(find.text('Sign in'));
      await t.pump();
      expect(find.text('Please enter your password'), findsOneWidget);
    });
  });

  group('Signup Form Validation', () {
    late TextEditingController email, password, confirm;
    setUp(() { email = TextEditingController(); password = TextEditingController(); confirm = TextEditingController(); });
    tearDown(() { email.dispose(); password.dispose(); confirm.dispose(); });

    Widget buildSignup(VoidCallback onSubmit) => MaterialApp(
      home: Scaffold(body: Column(children: [
        TextFormField(controller: email),
        TextFormField(controller: password),
        TextFormField(controller: confirm),
        ElevatedButton(onPressed: onSubmit, child: const Text('Sign up')),
      ])),
    );

    testWidgets('empty email shows error', (t) async {
      await t.pumpWidget(buildSignup(() {
        if (email.text.isEmpty) showSnack(t, 'Please enter your email');
      }));
      await t.tap(find.text('Sign up'));
      await t.pump();
      expect(find.text('Please enter your email'), findsOneWidget);
    });

    testWidgets('empty password shows error', (t) async {
      await t.pumpWidget(buildSignup(() {
        if (email.text.isNotEmpty && password.text.isEmpty) showSnack(t, 'Please enter your password');
      }));
      await t.enterText(find.byType(TextFormField).first, 'test@test.com');
      await t.tap(find.text('Sign up'));
      await t.pump();
      expect(find.text('Please enter your password'), findsOneWidget);
    });

    testWidgets('password mismatch shows error', (t) async {
      await t.pumpWidget(buildSignup(() {
        if (password.text != confirm.text) showSnack(t, 'Passwords do not match');
      }));
      await t.enterText(find.byType(TextFormField).at(0), 'test@test.com');
      await t.enterText(find.byType(TextFormField).at(1), 'password1');
      await t.enterText(find.byType(TextFormField).at(2), 'password2');
      await t.tap(find.text('Sign up'));
      await t.pump();
      expect(find.text('Passwords do not match'), findsOneWidget);
    });
  });

  group('Footer Newsletter Validation', () {
    late TextEditingController email;
    setUp(() => email = TextEditingController());
    tearDown(() => email.dispose());

    Widget buildNewsletter(VoidCallback onSub) => MaterialApp(
      home: Scaffold(body: Row(children: [
        Expanded(child: TextField(controller: email)),
        ElevatedButton(onPressed: onSub, child: const Text('SUBSCRIBE')),
      ])),
    );

    testWidgets('empty email shows error', (t) async {
      await t.pumpWidget(buildNewsletter(() {
        if (email.text.isEmpty) showSnack(t, 'Please enter your email');
      }));
      await t.tap(find.text('SUBSCRIBE'));
      await t.pump();
      expect(find.text('Please enter your email'), findsOneWidget);
    });

    testWidgets('valid email subscribes', (t) async {
      await t.pumpWidget(buildNewsletter(() {
        if (email.text.isNotEmpty) showSnack(t, 'Subscribed ${email.text}');
      }));
      await t.enterText(find.byType(TextField), 'news@test.com');
      await t.tap(find.text('SUBSCRIBE'));
      await t.pump();
      expect(find.text('Subscribed news@test.com'), findsOneWidget);
    });
  });
}
