part of 'sign_up_cubit.dart';

class SignUpState extends Equatable {
  final String message;
  final CubitStatus status;
  const SignUpState({required this.message, required this.status});
  factory SignUpState.intitial() {
    return SignUpState(message: '', status: CubitStatus.initial);
  }

  @override
  bool get stringify => true;

  SignUpState copyWith({String? message, CubitStatus? status}) {
    return SignUpState(
        message: message ?? this.message, status: status ?? this.status);
  }

  @override
  List<Object> get props => [message, status];
}
