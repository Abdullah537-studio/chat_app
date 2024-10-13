
part of 'login_cubit.dart';
class LoginState extends Equatable {
  final String message;
  final CubitStatus status;
  const LoginState({required this.message, required this.status});
  factory LoginState.initial() {
    return const LoginState(message: '', status: CubitStatus.initial);
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [message, status];

  LoginState copyWith({String? message, CubitStatus? status}) {
    return LoginState(
        message: message ?? this.message, status: status ?? this.status);
  }
}
