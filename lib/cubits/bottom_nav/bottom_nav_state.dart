import 'package:equatable/equatable.dart';

enum BottomNavTab { scan, history, settings }

class BottomNavState extends Equatable {
  final BottomNavTab selectedTab;

  const BottomNavState({this.selectedTab = BottomNavTab.scan});

  BottomNavState copyWith({BottomNavTab? selectedTab}) {
    return BottomNavState(selectedTab: selectedTab ?? this.selectedTab);
  }

  @override
  List<Object?> get props => [selectedTab];
}
