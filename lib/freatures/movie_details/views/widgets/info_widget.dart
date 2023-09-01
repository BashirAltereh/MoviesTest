import 'package:flutter/material.dart';
import 'package:golcoin_movies/core/views/widgets/animation_scale_widget.dart';
import 'package:sizer/sizer.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({required this.title, required this.subtitle, required this.icon,this.index = 0, super.key});

  final String title, subtitle;
  final IconData icon;
  final int index;

  @override
  Widget build(BuildContext context) {
    return AnimationScaleWidget(
      horizontalOffset: 75,
      verticalOffset: 0,
      position: index,
      child: Container(
          width: 20.w,
          margin: EdgeInsets.symmetric(vertical: 1.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Theme.of(context).colorScheme.primaryContainer)),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 1.2.h, ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(title,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w500,color: Theme.of(context).colorScheme.primaryContainer),
                    overflow: TextOverflow.ellipsis),
                const SizedBox(
                  height: 2,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Text(subtitle,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(color: Theme.of(context).colorScheme.secondary, fontSize: 9.sp),
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis),
                ),
                SizedBox(
                  height: 0.5.h,
                )
              ],
            ),
          )),
    );
  }
}
