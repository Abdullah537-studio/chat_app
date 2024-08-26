// import 'package:chat_2/features/auth/domin/entites/auth_model/requiest/login_request_entity.dart';
// import 'package:chat_2/features/auth/domin/entites/auth_model/response/login_response_entity.dart';
// import 'package:chat_2/features/auth/domin/usecases/login_usecase.dart';
// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';

// import '../../../../helper/test_helper.mocks.dart';

// void main() {
//   LoginUsecase loginUsecase;
//   MockAuthRepository mockAuthRepository;
//   setUp(() {
//     mockAuthRepository = MockAuthRepository();
//     loginUsecase = LoginUsecase(repository: mockAuthRepository);
//   });
//   test('should login user and get token ', () async {
//     final testResult = Result(
//       accessToken: "sadflkjsldfjks22222",
//       encryptedAccessToken: "asdfasdf",
//       expireInSeconds: 22,
//       userId: 222,
//     );
//     final testLoginResponse = LoginResponse(result: testResult);

//     final testlogiRequest = LoginRequest(
//       email: "ttt@gmail.com",
//       password: "tt@123456",
//       rememberMe: true,
//     );
//     // arrang
//     when(mockAuthRepository.login(loginEntite: testlogiRequest))
//         .thenAnswer((_) async => Right(testLoginResponse));
//     // act
//     final result = await loginUsecase.call(loginEntite: loginEntite)
//     //assert
//   });
// }
