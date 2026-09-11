import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yejing/cubits/bottom_nav/bottom_nav_cubit.dart';
import 'package:yejing/cubits/bottom_nav/bottom_nav_state.dart';
import 'package:yejing/l10n/l10n_extension.dart';
import 'package:yejing/utils/constants.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, BottomNavState>(
      builder: (context, state) {
        return Container(
          height: context.s(84),
          width: double.infinity,
          color: YeJingColors.pureWhite,
          child: Row(
            children: [
              _NavItem(
                icon: YeJingIcons.searchRounded,
                label: context.l10n.navScan,
                isActive: state.selectedTab == BottomNavTab.scan,
                onTap: () =>
                    context.read<BottomNavCubit>().selectTab(BottomNavTab.scan),
              ),
              _NavItem(
                icon: YeJingIcons.history,
                label: context.l10n.navHistory,
                isActive: state.selectedTab == BottomNavTab.history,
                onTap: () => context.read<BottomNavCubit>().selectTab(
                  BottomNavTab.history,
                ),
              ),
              _NavItem(
                icon: YeJingIcons.settings,
                label: context.l10n.navSettings,
                isActive: state.selectedTab == BottomNavTab.settings,
                onTap: () => context.read<BottomNavCubit>().selectTab(
                  BottomNavTab.settings,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _NavItem extends StatelessWidget {
  final String icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color color = isActive
        ? YeJingColors.primaryRed
        : YeJingColors.pureBlackWithAlpha24;

    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: SizedBox(
          child: Padding(
            padding: EdgeInsets.only(top: context.s(8)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  icon,
                  height: context.s(28),
                  width: context.s(28),
                  colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                ),
                SizedBox(height: context.s(4)),
                Text(
                  label,
                  style: YeJingTextStyles.n14.copyWith(
                    fontSize: context.sp(14),
                    fontWeight: FontWeight.w700,
                    color: color,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
