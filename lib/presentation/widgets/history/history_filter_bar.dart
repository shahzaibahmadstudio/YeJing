import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yejing/cubits/history/history_cubit.dart';
import 'package:yejing/cubits/history/history_state.dart';
import 'package:yejing/l10n/l10n_extension.dart';
import 'package:yejing/utils/constants.dart';

class HistoryFilterBar extends StatelessWidget {
  const HistoryFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryCubit, HistoryState>(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: Container(
                height: context.s(48),
                padding: EdgeInsets.symmetric(horizontal: context.s(16)),
                decoration: BoxDecoration(
                  color: YeJingColors.pureWhite,
                  borderRadius: BorderRadius.circular(context.s(12)),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      YeJingIcons.search,
                      height: context.s(16),
                      width: context.s(16),
                    ),
                    SizedBox(width: context.s(12)),
                    Expanded(
                      child: TextField(
                        onChanged: (value) =>
                            context.read<HistoryCubit>().filterByTitle(value),
                        cursorColor: YeJingColors.primaryRed,
                        style: YeJingTextStyles.n14.copyWith(
                          fontSize: context.sp(14),
                          fontWeight: FontWeight.w700,
                          color: YeJingColors.pureBlack,
                        ),
                        decoration: InputDecoration(
                          isDense: true,
                          border: InputBorder.none,
                          hintText: context.l10n.historySearchHint,
                          hintStyle: YeJingTextStyles.n14.copyWith(
                            fontSize: context.sp(14),
                            fontWeight: FontWeight.w700,
                            color: YeJingColors.pureBlackWithAlpha36,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: context.s(12)),
            GestureDetector(
              onTap: () => _pickDateRange(context),
              child: Container(
                height: context.s(48),
                width: context.s(48),
                decoration: BoxDecoration(
                  color: state.startDate != null
                      ? YeJingColors.primaryRed
                      : YeJingColors.pureWhite,
                  borderRadius: BorderRadius.circular(context.s(12)),
                ),
                child: Icon(
                  Icons.calendar_today_outlined,
                  size: context.s(20),
                  color: state.startDate != null
                      ? YeJingColors.pureWhite
                      : YeJingColors.pureBlackWithAlpha36,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _pickDateRange(BuildContext context) async {
    final DateTimeRange? range = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );

    if (range == null || !context.mounted) return;

    context.read<HistoryCubit>().filterByDateRange(range.start, range.end);
  }
}
