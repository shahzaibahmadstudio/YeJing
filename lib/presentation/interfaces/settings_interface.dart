import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yejing/cubits/history/history_cubit.dart';
import 'package:yejing/cubits/locale/locale_cubit.dart';
import 'package:yejing/cubits/locale/locale_state.dart';
import 'package:yejing/l10n/l10n_extension.dart';
import 'package:yejing/utils/constants.dart';

class SettingsInterface extends StatelessWidget {
  const SettingsInterface({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: context.s(24),
        vertical: context.s(32),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.navSettings,
            style: YeJingTextStyles.n24.copyWith(
              fontSize: context.sp(24),
              color: YeJingColors.pureBlack,
            ),
          ),
          SizedBox(height: context.s(36)),
          _LanguageSection(),
          SizedBox(height: context.s(36)),
          _DataSection(),
          SizedBox(height: context.s(36)),
          _AboutSection(),
          SizedBox(height: context.s(48)),
        ],
      ),
    );
  }
}

class _LanguageSection extends StatelessWidget {
  const _LanguageSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.settingsLanguageLabel,
          style: YeJingTextStyles.n14.copyWith(
            fontSize: context.sp(14),
            fontWeight: FontWeight.w700,
            color: YeJingColors.pureBlackWithAlpha36,
          ),
        ),
        SizedBox(height: context.s(16)),
        BlocBuilder<AppLocaleCubit, AppLocaleState>(
          builder: (context, localeState) {
            return Row(
              children: [
                Expanded(
                  child: _LanguageButton(
                    label: AppLanguage.en.displayName,
                    isActive: localeState.language == AppLanguage.en,
                    onTap: () {
                      if (localeState.language != AppLanguage.en) {
                        context.read<AppLocaleCubit>().toggleLanguage();
                      }
                    },
                  ),
                ),
                SizedBox(width: context.s(16)),
                Expanded(
                  child: _LanguageButton(
                    label: AppLanguage.zh.displayName,
                    isActive: localeState.language == AppLanguage.zh,
                    onTap: () {
                      if (localeState.language != AppLanguage.zh) {
                        context.read<AppLocaleCubit>().toggleLanguage();
                      }
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class _LanguageButton extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _LanguageButton({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: context.s(48),
        decoration: BoxDecoration(
          color: isActive ? YeJingColors.primaryRed : YeJingColors.pureWhite,
          borderRadius: BorderRadius.circular(context.s(12)),
        ),
        child: Center(
          child: Text(
            label,
            style: YeJingTextStyles.n14.copyWith(
              fontSize: context.sp(14),
              fontWeight: FontWeight.w700,
              color: isActive ? YeJingColors.pureWhite : YeJingColors.pureBlack,
            ),
          ),
        ),
      ),
    );
  }
}

class _DataSection extends StatelessWidget {
  const _DataSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.settingsDataLabel,
          style: YeJingTextStyles.n14.copyWith(
            fontSize: context.sp(14),
            fontWeight: FontWeight.w700,
            color: YeJingColors.pureBlackWithAlpha36,
          ),
        ),
        SizedBox(height: context.s(16)),
        GestureDetector(
          onTap: () async {
            await context.read<HistoryCubit>().clearAllScans();
            if (!context.mounted) return;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(context.l10n.historyClearedMessage),
                duration: const Duration(seconds: 2),
                backgroundColor: YeJingColors.primaryRed,
              ),
            );
          },
          child: Container(
            height: context.s(48),
            decoration: BoxDecoration(
              color: YeJingColors.primaryRedWithAlpha,
              borderRadius: BorderRadius.circular(context.s(12)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  YeJingIcons.delete,
                  height: context.s(18),
                  width: context.s(18),
                  colorFilter: ColorFilter.mode(
                    YeJingColors.primaryRed,
                    BlendMode.srcIn,
                  ),
                ),
                SizedBox(width: context.s(12)),
                Text(
                  context.l10n.settingsClearHistoryLabel,
                  style: YeJingTextStyles.n14.copyWith(
                    fontSize: context.sp(14),
                    fontWeight: FontWeight.w700,
                    color: YeJingColors.primaryRed,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _AboutSection extends StatelessWidget {
  const _AboutSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.settingsAboutLabel,
          style: YeJingTextStyles.n14.copyWith(
            fontSize: context.sp(14),
            fontWeight: FontWeight.w700,
            color: YeJingColors.pureBlackWithAlpha36,
          ),
        ),
        SizedBox(height: context.s(16)),
        Container(
          decoration: BoxDecoration(
            color: YeJingColors.pureWhite,
            borderRadius: BorderRadius.circular(context.s(24)),
          ),
          padding: EdgeInsets.all(context.s(24)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: context.s(48),
                    width: context.s(48),
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: YeJingColors.primaryRed,
                      borderRadius: BorderRadius.circular(context.s(12)),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Image.asset(YeJingImages.logo, fit: BoxFit.contain),
                  ),
                  SizedBox(width: context.s(16)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.l10n.yejingTitle,
                        style: YeJingTextStyles.n20.copyWith(
                          fontSize: context.sp(20),
                          color: YeJingColors.pureBlack,
                        ),
                      ),
                      SizedBox(height: context.s(4)),
                      Text(
                        context.l10n.appVersion,
                        style: YeJingTextStyles.n12.copyWith(
                          fontSize: context.sp(12),
                          fontWeight: FontWeight.w500,
                          color: YeJingColors.pureBlackWithAlpha72,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: context.s(16)),
              Text(
                context.l10n.appDisclaimer,
                style: YeJingTextStyles.n12.copyWith(
                  fontSize: context.sp(12),
                  fontWeight: FontWeight.w500,
                  color: YeJingColors.pureBlackWithAlpha72,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
