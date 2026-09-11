import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yejing/cubits/bottom_nav/bottom_nav_state.dart';

class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit() : super(const BottomNavState());

  void selectTab(BottomNavTab tab) {
    if (state.selectedTab == tab) return;
    emit(state.copyWith(selectedTab: tab));
  }
}
