import 'package:chat_2/features/auth/domin/repository/auth_repository.dart';
import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

// flutter pub run build_runner build
@GenerateMocks([AuthRepository],
    customMocks: [MockSpec<http.Client>(as: #MockHttpClient)])
void main() {}
