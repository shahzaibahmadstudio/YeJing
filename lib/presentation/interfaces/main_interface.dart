import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yejing/blocs/scan/scan_bloc.dart';
import 'package:yejing/cubits/bottom_nav/bottom_nav_cubit.dart';
import 'package:yejing/cubits/bottom_nav/bottom_nav_state.dart';
import 'package:yejing/cubits/history/history_cubit.dart';
import 'package:yejing/presentation/interfaces/history_interface.dart';
import 'package:yejing/presentation/interfaces/scan_interface.dart';
import 'package:yejing/presentation/interfaces/settings_interface.dart';
import 'package:yejing/presentation/widgets/custom_app_bar.dart';
import 'package:yejing/presentation/widgets/custom_bottom_nav.dart';
import 'package:yejing/utils/constants.dart';

class MainInterface extends StatelessWidget {
  const MainInterface({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BottomNavCubit()),
        BlocProvider(create: (_) => ScanBloc()),
        BlocProvider(create: (_) => HistoryCubit()..loadAllScans()),
      ],
      child: BlocListener<BottomNavCubit, BottomNavState>(
        listenWhen: (previous, current) =>
            current.selectedTab == BottomNavTab.history,
        listener: (context, state) {
          context.read<HistoryCubit>().loadAllScans();
        },
        child: Scaffold(
          backgroundColor: YeJingColors.background,
          body: Column(
            children: [
              const CustomAppBar(),
              Expanded(
                child: BlocBuilder<BottomNavCubit, BottomNavState>(
                  builder: (context, state) {
                    return IndexedStack(
                      index: state.selectedTab.index,
                      children: const [
                        ScanInterface(),
                        HistoryInterface(),
                        SettingsInterface(),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
          bottomNavigationBar: const CustomBottomNav(),
        ),
      ),
    );
  }
}
