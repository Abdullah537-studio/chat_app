import 'package:bloc_test/bloc_test.dart';
import 'package:chat_2/core/enum/cubit_enum.dart';
import 'package:chat_2/core/shared/shared_pref.dart';
import 'package:chat_2/features/auth/domin/entites/auth_model/requiest/login_request_entity.dart';
import 'package:chat_2/features/auth/domin/entites/auth_model/response/login_response_entity.dart';
import 'package:chat_2/features/auth/presentation/cubit/auth_cubit/login_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helper/test_helper.mocks.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockLoginUsecase mockLoginUsecase;
  late LoginCubit loginCubit;

  var mockSharedPreferences = MockSharedPreferences();
  when(mockSharedPreferences.getString('access_token'))
      .thenReturn('some_token');
  when(mockSharedPreferences.getString('id_chat_bubble_partner'))
      .thenReturn('some_chat_bubble_id');
  AppSharedPreferences.init(mockSharedPreferences);

  setUp(() {
    mockLoginUsecase = MockLoginUsecase();
    loginCubit = LoginCubit(mockLoginUsecase);
  });

  const result = Result(
    accessToken: "sadflkjsldfjks22222",
    encryptedAccessToken: "asdfasdf",
    expireInSeconds: 22,
    userId: 222,
  );
  const loginResponse = LoginResponse(result: result);

  var loginRequest = LoginRequest(
      email: "ttt@gmail.com", password: "Ttt@123456", rememberMe: true);

  test('initial state should be empty', () {
    expect(loginCubit.state,
        loginCubit.state.copyWith(status: CubitStatus.initial));
  });
  blocTest<LoginCubit, LoginState>(
    'should emit loading then done when data is gotten successfully',
    build: () {
      when(mockLoginUsecase.call(loginEntite: loginRequest))
          .thenAnswer((_) async => const Right(loginResponse));
      when(mockSharedPreferences.setString(any, any))
          .thenAnswer((_) async => true);
      when(mockSharedPreferences.setInt(any, any))
          .thenAnswer((_) async => true);
      return loginCubit;
    },
    act: (cubit) async {
      await cubit.login(loginEntity: loginRequest);
    },
    wait: const Duration(milliseconds: 500),
    expect: () => [
      loginCubit.state.copyWith(status: CubitStatus.loading),
      loginCubit.state.copyWith(status: CubitStatus.done),
    ],
  );
}
