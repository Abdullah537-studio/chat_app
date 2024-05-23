import 'package:chat_2/core/enum/tab_bar_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat_2/core/enum/cubit_enum.dart';

part 'bootom_tab_bar_state.dart';

class BootomTabBarCubit extends Cubit<BootomTabBarState> {
  BootomTabBarCubit() : super(BootomTabBarState.initial());
  String? textAppBar;
  int? index;
  TabBarStatus? tabBarStatus;

  getIndexTabBar() async {
    emit(
      state.copyWith(
        status: CubitStatus.done,
        index: index,
        textAppBar: textAppBar,
        tabBarStatus: tabBarStatus,
      ),
    );
  }
}
