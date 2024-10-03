import 'package:chat_2/core/enum/tab_bar_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat_2/core/enum/cubit_enum.dart';

part 'bootom_tab_bar_state.dart';

class BootomTabBarCubit extends Cubit<BootomTabBarState> {
  BootomTabBarCubit() : super(BootomTabBarState.initial());
  // String? textAppBar;
  // TabBarStatus? tabBarStatus;

  getIndexTabBar(TabBarStatus tabBarStatus) async {
    if (tabBarStatus == TabBarStatus.chatBubble) {
      emit(state.copyWith(
        status: CubitStatus.done,
        tabBarStatus: TabBarStatus.chatBubble,
        index: 2,
      ));
    } else if (tabBarStatus == TabBarStatus.chatInfo) {
      emit(state.copyWith(
        status: CubitStatus.done,
        tabBarStatus: TabBarStatus.chatInfo,
        index: 2,
      ));
    } else if (tabBarStatus == TabBarStatus.search) {
      emit(state.copyWith(
        status: CubitStatus.done,
        tabBarStatus: TabBarStatus.search,
        index: 1,
      ));
    } else if (tabBarStatus == TabBarStatus.suggetionPartner) {
      emit(state.copyWith(
        status: CubitStatus.done,
        tabBarStatus: TabBarStatus.suggetionPartner,
        index: 1,
      ));
    } else {
      emit(state.copyWith(
        status: CubitStatus.done,
        tabBarStatus: TabBarStatus.home,
        index: 0,
      ));
    }
  }
}
