import 'package:chat_2/core/strings/image_base64.dart';
import 'package:chat_2/features/auth/domin/entites/auth_model/requiest/signup_request_entity.dart';
import 'package:chat_2/features/auth/domin/entites/auth_model/response/signup_response_entity.dart';
import 'package:chat_2/features/auth/domin/usecases/signup_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helper/test_helper.mocks.dart';

void main() {
  late SigninUseCase signinUseCase;
  late MockAuthRepository authRepository;
  setUp(() {
    authRepository = MockAuthRepository();
    signinUseCase = SigninUseCase(repository: authRepository);
  });
  final singinRequest = SigninRequest(
    age: 22,
    cityId: 1,
    countryId: 1,
    emailAddress: "ttt@gmail.com",
    password: "Ttt@123456",
    phoneNumber: "096870313",
    gender: 0,
    name: "mosatkssa",
    avatar: ImageBase64ToTestTdd(),
  );
  final signinResponse = SigninResponse(
    canLogin: true,
  );

  test('should get sign in currectly ', () async {
    // arrange
    when(authRepository.signin(signinEntite: singinRequest))
        .thenAnswer((_) async => Right(signinResponse));

    // act
    final result = await signinUseCase.call(signinEntite: singinRequest);

    // assert
    expect(result, Right(signinResponse));
  });
}
