import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SummaryWidget extends StatelessWidget {
  const SummaryWidget({super.key, required this.summary});

  final String summary;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 1.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'plot_summary'.tr(),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).colorScheme.secondary),
          ),
          SizedBox(height: 0.5.h,),
          Text(
            summary,
            style:
                Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.primaryContainer,height: 1.4),
          )
        ],
      ),
    );
  }
}
