import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yejing/blocs/scan/scan_bloc.dart';
import 'package:yejing/blocs/scan/scan_event.dart';
import 'package:yejing/l10n/l10n_extension.dart';
import 'package:yejing/utils/constants.dart';

class ScanPickedWidget extends StatelessWidget {
  final File imageFile;

  const ScanPickedWidget({required this.imageFile, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.s(24),
        vertical: context.s(32),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.scanTitle,
            style: YeJingTextStyles.n24.copyWith(
              fontSize: context.sp(24),
              color: YeJingColors.pureBlack,
            ),
          ),
          SizedBox(height: context.s(4)),
          Text(
            context.l10n.scanSubtitle,
            style: YeJingTextStyles.n16.copyWith(
              fontSize: context.sp(16),
              fontWeight: FontWeight.w700,
              color: YeJingColors.pureBlackWithAlpha36,
            ),
          ),
          SizedBox(height: context.s(36)),
          Stack(
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(context.s(12)),
                child: Image.file(
                  imageFile,
                  height: context.s(250),
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: -context.s(12),
                right: -context.s(12),
                child: GestureDetector(
                  onTap: () =>
                      context.read<ScanBloc>().add(const ScanResetEvent()),
                  child: Container(
                    height: context.s(24),
                    width: context.s(24),
                    decoration: const BoxDecoration(
                      color: YeJingColors.primaryRed,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.close,
                      size: context.s(16),
                      color: YeJingColors.pureWhite,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: context.s(18)),
          GestureDetector(
            onTap: () => context.read<ScanBloc>().add(const ScanProcessEvent()),
            child: Container(
              height: context.s(64),
              width: double.infinity,
              decoration: BoxDecoration(
                color: YeJingColors.primaryRed,
                borderRadius: BorderRadius.circular(context.s(12)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    YeJingIcons.camera,
                    height: context.s(16),
                    width: context.s(19),
                    colorFilter: ColorFilter.mode(
                      YeJingColors.pureWhite,
                      BlendMode.srcIn,
                    ),
                  ),
                  SizedBox(width: context.s(8)),
                  Text(
                    context.l10n.scanAnalyzeButton,
                    style: YeJingTextStyles.n16.copyWith(
                      fontSize: context.sp(16),
                      fontWeight: FontWeight.w900,
                      color: YeJingColors.pureWhite,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
