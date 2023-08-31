import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:golcoin_movies/core/views/widgets/image_view.dart';
import 'package:sizer/sizer.dart';

class FavoriteMovieCard extends StatelessWidget {
  const FavoriteMovieCard({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
      color: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), side: BorderSide(color: Theme.of(context).colorScheme.primary)),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), padding: EdgeInsets.zero),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 1.2.h),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: SizedBox(
                        height: 12.h,
                        width: 18.w,
                        child: const ImageView(
                            imageUrl:
                                'https://media.istockphoto.com/id/952063296/photo/conference-room.jpg?s=2048x2048&w=is&k=20&c=Pkze4PuxUP6_GmEycXW0iDKGwYZEu8wlDKM_8fwMp5E='),
                      ),
                    ),
                    _contentWidget(context),
                  ],
                ),
              ),
              _deleteWidget(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _deleteWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {},
        tooltip: 'delete'.tr(),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
    );
  }

  Widget _contentWidget(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 0.5.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Avatar: The wat of water',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.w500)),
            SizedBox(
              height: 1.h,
            ),
            Text('set mote mote motemotmeomteomo oj oj ioj lj lj hj h jlh lhld asd asd asd s',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
