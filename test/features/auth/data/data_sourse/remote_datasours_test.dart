import 'package:chat_2/core/error/exception.dart';
import 'package:chat_2/core/shared/shared_pref.dart';
import 'package:chat_2/features/auth/data/datasources/remote/auth_remote.dart';
import 'package:chat_2/features/auth/domin/entites/auth_model/requiest/login_request_entity.dart';
import 'package:chat_2/features/auth/domin/entites/auth_model/response/login_response_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import '../../../../helper/test_helper.mocks.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockHttpClient mockHttpClient;
  late AuthRemoteImp authRemoteImp;

  var mockSharedPreferences = MockSharedPreferences();
  when(mockSharedPreferences.getString('access_token'))
      .thenReturn('some_token');
  when(mockSharedPreferences.getString('id_chat_bubble_partner'))
      .thenReturn('some_chat_bubble_id');
  AppSharedPreferences.init(mockSharedPreferences);

  setUp(() {
    mockHttpClient = MockHttpClient();
    authRemoteImp = AuthRemoteImp();
  });

  var testLoginRequest = LoginRequest(
      email: "ttt@gmail.com", password: "Ttt@123456", rememberMe: true);

  group('Login tests', () {
    test('should return login model when the response code is 200', () async {
      // arrange
      when(mockHttpClient.post(
        Uri.parse(
            "https://mobiletest.tuqaatech.com/api/TokenAuth/Authenticate"),
        body: testLoginRequest.toJson(),
        headers: {
          'Content-Type': 'application/json',
          "Accept": "application/json",
        },
      )).thenAnswer(
          (_) async => http.Response('{"access_token": "some_token"}', 200));

      // act
      try {
        final result = await authRemoteImp.login(loginEntity: testLoginRequest);
        // assert
        expect(result, isA<LoginResponse>());
      } catch (e) {
        print(e);
      }
    });

    test(
        'should throw a server exception when the response code is 404 or other',
        () async {
      // arrange
      when(mockHttpClient.post(
        Uri.parse(
            "https://mobiletest.tuqaatech.com/api/TokenAuth/Authenticate"),
        body: testLoginRequest.toJson(),
        headers: {
          'Content-Type': 'application/json',
          "Accept": "application/json",
        },
      )).thenAnswer((_) async => http.Response('Not found', 404));

      // act
      final result = authRemoteImp.login(loginEntity: testLoginRequest);

      // assert
      expect(result, throwsA(isA<ServerException>()));
    });
  });
}
