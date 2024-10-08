import 'package:http/http.dart';

class ServerException implements Exception {
  final Response? response;
  ServerException({
    this.response,
  });
}

class EmptyCacheException implements Exception {}

class OfflineException implements Exception {}
