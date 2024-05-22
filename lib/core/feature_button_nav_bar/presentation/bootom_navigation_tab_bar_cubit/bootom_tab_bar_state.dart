part of 'bootom_tab_bar_cubit.dart';

class BootomTabBarState {
  final String message;
  final CubitStatus status;
  TabBarStatus tabBarStatus;
  String? textAppBar;
  int? index;
  BootomTabBarState({
    required this.tabBarStatus,
    required this.textAppBar,
    required this.index,
    required this.message,
    required this.status,
  });

  factory BootomTabBarState.initial() {
    return BootomTabBarState(
      tabBarStatus: TabBarStatus.home,
      textAppBar: "Home",
      index: 0,
      message: "",
      status: CubitStatus.initial,
    );
  }

  BootomTabBarState copyWith({
    String? message,
    CubitStatus? status,
    String? textAppBar,
    int? index,
    TabBarStatus? tabBarStatus,
  }) {
    return BootomTabBarState(
      tabBarStatus: tabBarStatus ?? this.tabBarStatus,
      textAppBar: textAppBar ?? this.textAppBar,
      index: index ?? this.index,
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }
}
