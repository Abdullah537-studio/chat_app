import 'package:chat_2/core/network/network_info.dart';
import 'package:chat_2/features/auth/data/repository/auth_repository_impl.dart';
import 'package:chat_2/features/auth/domin/entites/auth_model/requiest/login_request_entity.dart';
import 'package:chat_2/features/auth/domin/entites/auth_model/response/login_response_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/mockito.dart';

import '../../../../helper/test_helper.mocks.dart';

void main() {
  late MockAuhtRemote mockAuhtRemote;
  late AuthRepositoryImpl authRepositoryImpl;
  late NetworkInfoImplemntes networkInfoImplemntes;
  late InternetConnectionChecker internetConnectionChecker;
  setUp(() {
    internetConnectionChecker = InternetConnectionChecker();
    networkInfoImplemntes = NetworkInfoImplemntes(internetConnectionChecker);
    mockAuhtRemote = MockAuhtRemote();
    authRepositoryImpl = AuthRepositoryImpl(
        auhtRemote: mockAuhtRemote, networkInformation: networkInfoImplemntes);
  });
  const resu = Result(
    accessToken: "sadflkjsldfjks22222",
    encryptedAccessToken: "asdfasdf",
    expireInSeconds: 22,
    userId: 222,
  );
  const loginResponse = LoginResponse(result: resu);

  var loginRequiest = LoginRequest(
    email: "ttt@gmail.com",
    password: "Ttt@123456",
    rememberMe: true,
  );

  group(
    'get current token',
    () {
      test(
        'should return current token when a call to data source is successful',
        () async {
          // arrange
          when(mockAuhtRemote.login(loginEntity: loginRequiest))
              .thenAnswer((_) async => loginResponse);

          // act
          final result =
              await authRepositoryImpl.login(loginEntite: loginRequiest);

          // assert
          expect(result, equals(const Right(loginResponse)));
        },
      );
//! server exception
      // test(
      //   'should return server failure when a call to data source is unsuccessful',
      //   () async {
      //     // arrange
      //     when(mockAuhtRemote.login(loginEntity: loginRequiest))
      //         .thenThrow(ServerException());

      //     // act
      //     final result =
      //         await authRepositoryImpl.login(loginEntite: loginRequiest);

      //     // assert
      //     expect(result, equals(const Left(Failure(error: "Server error"))));
      //   },
      // );
//! server exception
      // test(
      //   'should return connection failure when the device has no internet',
      //   () async {
      //     // arrange
      //     when(mockAuhtRemote.login(loginEntity: loginRequiest)).thenThrow(
      //         const SocketException('Failed to connect to the network'));

      //     // act
      //     final result =
      //         await authRepositoryImpl.login(loginEntite: loginRequiest);

      //     // assert
      //     expect(
      //       result,
      //       equals(
      //         const Left(
      //           Failure(error: "Failed to connect to the network"),
      //         ),
      //       ),
      //     );
      //   },
      // );
    },
  );
}
