import 'dart:async';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fordev/ui/pages/pages.dart';
import 'package:mockito/mockito.dart';

class LoginPresenterSpy extends Mock implements LoginPresenter {}

main() {
  LoginPresenter presenter;
  StreamController<String> emailErrorController;
  StreamController<String> passwordErrorController;
  StreamController<bool> isFormValidErrorController;

  Future<void> loginPage(WidgetTester tester) async {
    presenter = LoginPresenterSpy();
    emailErrorController = StreamController<String>();
    passwordErrorController = StreamController<String>();
    isFormValidErrorController = StreamController<bool>();

    when(presenter.emailErrorStream)
        .thenAnswer((_) => emailErrorController.stream);
    when(presenter.passwordErrorStream)
        .thenAnswer((_) => passwordErrorController.stream);
    when(presenter.isFormValidErrorStream)
        .thenAnswer((_) => isFormValidErrorController.stream);

    final loginPage = MaterialApp(home: LoginPage(presenter: presenter));
    await tester.pumpWidget(loginPage);
  }

  tearDown(() {
    emailErrorController.close();
    passwordErrorController.close();
    isFormValidErrorController.close();
  });

  testWidgets(
    'Should load with correct initial state',
    (WidgetTester tester) async {
      await loginPage(tester);

      final emailTextChildren = find.descendant(
        of: find.bySemanticsLabel('Email'),
        matching: find.byType(Text),
      );

      expect(
        emailTextChildren,
        findsOneWidget,
        reason:
            'Teste tem o intuito de testar se o textFormField tem apenas um filho do tipo texto, o label ',
      );

      final senhaTextChildren = find.descendant(
        of: find.bySemanticsLabel('Senha'),
        matching: find.byType(Text),
      );

      expect(
        senhaTextChildren,
        findsOneWidget,
        reason:
            'Teste tem o intuito de testar se o textFormField tem apenas um filho do tipo texto, o label ',
      );

      final button = tester.widget<RaisedButton>(
        find.byType(RaisedButton),
      );

      expect(button.onPressed, null);
    },
  );
  testWidgets(
    'Should call validator correct value',
    (WidgetTester tester) async {
      await loginPage(tester);

      final email = faker.internet.email();
      await tester.enterText(find.bySemanticsLabel('Email'), email);
      verify(presenter.validateEmail(email));

      final password = faker.internet.password();
      await tester.enterText(find.bySemanticsLabel('Senha'), password);
      verify(presenter.validatePassword(password));
    },
  );
  testWidgets(
    'Should present erro is email is invalid',
    (WidgetTester tester) async {
      await loginPage(tester);

      emailErrorController.add('any error');
      await tester.pump(); // renderizar os components novamente

      expect(find.text('any error'), findsOneWidget);
    },
  );
  testWidgets(
    'Should present no erro is email is valid',
    (WidgetTester tester) async {
      await loginPage(tester);

      emailErrorController.add(null);
      await tester.pump(); // renderizar os components novamente

      final emailTextChildren = find.descendant(
        of: find.bySemanticsLabel('Email'),
        matching: find.byType(Text),
      );

      expect(
        emailTextChildren,
        findsOneWidget,
      );
    },
  );
  testWidgets(
    'Should present no erro is email is valid',
    (WidgetTester tester) async {
      await loginPage(tester);

      emailErrorController.add('');
      await tester.pump(); // renderizar os components novamente

      final emailTextChildren = find.descendant(
        of: find.bySemanticsLabel('Email'),
        matching: find.byType(Text),
      );

      expect(
        emailTextChildren,
        findsOneWidget,
      );
    },
  );
  testWidgets(
    'Should present erro is password is invalid',
    (WidgetTester tester) async {
      await loginPage(tester);

      passwordErrorController.add('any error');
      await tester.pump(); // renderizar os components novamente

      expect(find.text('any error'), findsOneWidget);
    },
  );
  testWidgets(
    'Should present no erro is password is valid',
    (WidgetTester tester) async {
      await loginPage(tester);

      passwordErrorController.add(null);
      await tester.pump(); // renderizar os components novamente

      final emailTextChildren = find.descendant(
        of: find.bySemanticsLabel('Senha'),
        matching: find.byType(Text),
      );

      expect(
        emailTextChildren,
        findsOneWidget,
      );
    },
  );
  testWidgets(
    'Should present no erro is password is valid',
    (WidgetTester tester) async {
      await loginPage(tester);

      passwordErrorController.add('');
      await tester.pump(); // renderizar os components novamente

      final emailTextChildren = find.descendant(
        of: find.bySemanticsLabel('Senha'),
        matching: find.byType(Text),
      );

      expect(
        emailTextChildren,
        findsOneWidget,
      );
    },
  );
  testWidgets(
    'Should eneble button if form is valid',
    (WidgetTester tester) async {
      await loginPage(tester);

      isFormValidErrorController.add(true);
      await tester.pump(); // renderizar os components novamente

      final button = tester.widget<RaisedButton>(
        find.byType(RaisedButton),
      );
      expect(button.onPressed, isNotNull);
    },
  );
  testWidgets(
    'Should eneble button if form is invalid',
    (WidgetTester tester) async {
      await loginPage(tester);

      isFormValidErrorController.add(false);
      await tester.pump(); // renderizar os components novamente

      final button = tester.widget<RaisedButton>(
        find.byType(RaisedButton),
      );
      expect(button.onPressed, null);
    },
  );
}
