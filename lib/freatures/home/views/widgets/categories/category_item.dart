import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.title, required this.emoji, this.onPressed});

  final String title, emoji;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 4.w),
      child: CupertinoButton(
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 0,
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
              child: SizedBox(
                height: 9.h,
                width: 9.h,
                child: Center(
                    child: Text(
                  emoji,
                  style: Theme.of(context).textTheme.displayMedium,
                )),
              ),
            ),
            SizedBox(
              width: 9.h,
              child: Padding(
                padding: EdgeInsetsDirectional.only(top: 0.5.h, start: 1.w),
                child: Text(title,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: Theme.of(context).colorScheme.secondary),
                    overflow: TextOverflow.ellipsis),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
