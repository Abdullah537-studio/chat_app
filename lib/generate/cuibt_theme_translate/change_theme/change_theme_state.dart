part of 'change_theme_cubit.dart';

class ChangeThemeState extends Equatable {
  final CubitStatus status;
  final ThemesStatus themeStatus;
  final bool? isSelected;
  const ChangeThemeState({
    required this.status,
    required this.themeStatus,
    this.isSelected = false,
  });
  factory ChangeThemeState.initial() {
    return ChangeThemeState(
        status: CubitStatus.initial,
        themeStatus: ThemesStatus.light,
        isSelected: false);
  }

  ChangeThemeState copyWith(
      {CubitStatus? status, ThemesStatus? themeStatus, bool? isSelected}) {
    return ChangeThemeState(
      status: status ?? this.status,
      themeStatus: themeStatus ?? this.themeStatus,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  List<Object> get props => [status, themeStatus, isSelected ?? false];
}
