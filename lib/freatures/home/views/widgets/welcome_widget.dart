import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:golcoin_movies/core/utils/constants.dart';
import 'package:sizer/sizer.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({super.key});

  final String tempName = 'Bashir';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${'welcome'.tr()} $tempName ${Constants.hiEmoji}',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(color: Theme.of(context).colorScheme.secondary)),
                const SizedBox(
                  height: 4,
                ),
                Text('intro_text'.tr(),
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w500,color: Theme.of(context).colorScheme.primaryContainer)),
              ],
            ),
          ),
          const FlutterLogo(
            size: 50,
          )
        ],
      ),
    );
  }
}
