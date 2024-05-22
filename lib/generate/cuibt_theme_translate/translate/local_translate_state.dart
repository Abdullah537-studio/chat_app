part of 'local_translate_cubit.dart';

class LocalTranslateState extends Equatable {
  final String message;
  final CubitStatus status;
  final Locale? locale;
  const LocalTranslateState({
    required this.message,
    required this.status,
    this.locale,
  });
  factory LocalTranslateState.initial() {
    return LocalTranslateState(message: "", status: CubitStatus.initial);
  }

  LocalTranslateState copyWith(
      {String? message, CubitStatus? status, Locale? locale}) {
    return LocalTranslateState(
      message: message ?? this.message,
      status: status ?? this.status,
      locale: locale ?? this.locale,
    );
  }

  @override
  List<Object> get props => [message, status];
}
