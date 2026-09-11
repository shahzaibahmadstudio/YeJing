import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yejing/cubits/locale/locale_cubit.dart';
import 'package:yejing/cubits/locale/locale_state.dart';
import 'package:yejing/l10n/l10n_extension.dart';
import 'package:yejing/utils/constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity,
          color: YeJingColors.primaryRed,
          padding: EdgeInsets.only(top: statusBarHeight),
          child: SizedBox(
            height: context.s(120),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: context.s(24)),
              child: Row(
                children: [
                  Image.asset(
                    YeJingImages.logo,
                    height: context.s(60),
                    width: context.s(64),
                    fit: BoxFit.contain,
                  ),
                  SizedBox(width: context.s(16)),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.l10n.yejingTitle,
                        style: YeJingTextStyles.n24.copyWith(
                          fontSize: context.sp(24),
                          color: YeJingColors.background,
                        ),
                      ),
                      Text(
                        context.l10n.plantDiseaseDiagnosis,
                        style: YeJingTextStyles.n14.copyWith(
                          fontSize: context.sp(14),
                          color: YeJingColors.background,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  _LanguageToggle(),
                ],
              ),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: context.s(4),
          color: YeJingColors.secondaryYellow,
        ),
      ],
    );
  }
}

class _LanguageToggle extends StatelessWidget {
  const _LanguageToggle();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppLocaleCubit, AppLocaleState>(
      builder: (context, localeState) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => context.read<AppLocaleCubit>().toggleLanguage(),
          child: Container(
            height: context.s(36),
            width: context.s(64),
            decoration: BoxDecoration(
              color: YeJingColors.pureWhiteVariation,
              borderRadius: BorderRadius.circular(context.s(24)),
            ),
            child: Center(
              child: Text(
                localeState.language.toggleLabel,
                style: YeJingTextStyles.n16.copyWith(
                  fontSize: context.sp(16),
                  color: YeJingColors.background,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
