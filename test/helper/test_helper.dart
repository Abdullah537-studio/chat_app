import 'package:chat_2/features/auth/data/datasources/remote/auth_remote.dart';
import 'package:chat_2/features/auth/domin/repository/auth_repository.dart';
import 'package:chat_2/features/auth/domin/usecases/login_usecase.dart';
import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// flutter pub run build_runner build
@GenerateMocks([AuthRepository, AuhtRemote, LoginUsecase, SharedPreferences],
    customMocks: [MockSpec<http.Client>(as: #MockHttpClient)])
void main() {}
