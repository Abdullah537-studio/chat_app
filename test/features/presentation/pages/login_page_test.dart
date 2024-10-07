import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:chat_2/core/enum/cubit_enum.dart';
import 'package:chat_2/core/widget/loading_indicator.dart';
import 'package:chat_2/features/auth/presentation/cubit/auth_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLoginCubit extends MockCubit<LoginState> implements LoginCubit {}

void main() {
  late MockLoginCubit mockLoginCubit;

  setUp(() {
    mockLoginCubit = MockLoginCubit();
    HttpOverrides.global = null;

    // تعيين الحالة الابتدائية
    when(() => mockLoginCubit.state).thenReturn(LoginState.initial());
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<LoginCubit>(
      create: (context) => mockLoginCubit,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets(
    'text field should trigger state to change from empty to loading',
    (widgetTester) async {
      //arrange
      final initialState = LoginState(status: CubitStatus.initial, message: '');
      when(() => mockLoginCubit.state).thenReturn(initialState);
//       //act
//       // await widgetTester.pumpWidget(_makeTestableWidget(
//       //   LoginPage(),
//       // ));
//       // var textField = find.byType(TextField);
//       // expect(textField, findsOneWidget);
//       // await widgetTester.enterText(textField, 'syria');
//       // await widgetTester.pump();
//       // expect(find.text('Damascus'), findsOneWidget);
    },
  );

  testWidgets(
    'should show progress indicator when state is loading',
    (widgetTester) async {
      //arrange
      final loadingState = LoginState(status: CubitStatus.loading, message: '');
      when(() => mockLoginCubit.state).thenReturn(loadingState);

      //act
      await widgetTester.pumpWidget(_makeTestableWidget(
        loadingIndicator(),
      ));

      //assert
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    },
  );

  testWidgets(
    'should show widget contain weather data when state is weather loaded',
    (widgetTester) async {
      //arrange
      final doneState = LoginState(status: CubitStatus.done, message: '');
      when(() => mockLoginCubit.state).thenReturn(doneState);
//       // act
//       // await widgetTester.pumpWidget(_makeTestableWidget(
//       //   LoginPage(),
//       // ));

//       // assert
//       // expect(find.byKey(const Key('data')), findsOneWidget);
    },
  );
}
