import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yejing/blocs/scan/scan_bloc.dart';
import 'package:yejing/blocs/scan/scan_event.dart';
import 'package:yejing/l10n/l10n_extension.dart';
import 'package:yejing/utils/constants.dart';

class ScanInitialWidget extends StatelessWidget {
  const ScanInitialWidget({super.key});

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
          GestureDetector(
            onTap: () => _showImageSourceSheet(context),
            child: Container(
              height: context.s(250),
              width: double.infinity,
              decoration: BoxDecoration(
                color: YeJingColors.pureWhite,
                borderRadius: BorderRadius.circular(context.s(12)),
                border: Border.all(
                  color: YeJingColors.pureBlackWithAlpha36,
                  width: 1,
                  style: BorderStyle.solid,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      YeJingImages.leaf,
                      height: context.s(84),
                      width: context.s(84),
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: context.s(16)),
                    Text(
                      context.l10n.scanFileHint,
                      style: YeJingTextStyles.n14.copyWith(
                        fontSize: context.sp(14),
                        fontWeight: FontWeight.w700,
                        color: YeJingColors.pureBlackWithAlpha36,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: context.s(18)),
          Container(
            height: context.s(64),
            width: double.infinity,
            decoration: BoxDecoration(
              color: YeJingColors.pureBlackWithAlpha8,
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
                    YeJingColors.pureBlackWithAlpha36,
                    BlendMode.srcIn,
                  ),
                ),
                SizedBox(width: context.s(8)),
                Text(
                  context.l10n.scanAnalyzeButton,
                  style: YeJingTextStyles.n16.copyWith(
                    fontSize: context.sp(16),
                    fontWeight: FontWeight.w900,
                    color: YeJingColors.pureBlackWithAlpha36,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void _showImageSourceSheet(BuildContext context) {
  final ScanBloc scanBloc = context.read<ScanBloc>();

  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(context.s(16))),
    ),
    builder: (sheetContext) {
      return SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt_outlined),
              title: Text(context.l10n.scanTakePhoto),
              onTap: () {
                Navigator.pop(sheetContext);
                scanBloc.add(
                  const ScanImagePickedEvent(source: ImageSource.camera),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: Text(context.l10n.scanChooseFromGallery),
              onTap: () {
                Navigator.pop(sheetContext);
                scanBloc.add(
                  const ScanImagePickedEvent(source: ImageSource.gallery),
                );
              },
            ),
            SizedBox(height: context.s(8)),
          ],
        ),
      );
    },
  );
}
