import 'package:flutter/material.dart';
import 'package:golcoin_movies/core/views/widgets/image_view.dart';
import 'package:sizer/sizer.dart';

class ActorItem extends StatelessWidget {
  const ActorItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 1.h),
      child: Column(
        children: [
          const SizedBox(
            height: 64,
            width: 64,
            child: ImageView(
                radius: 100,
                imageUrl:
                    'https://media.istockphoto.com/id/952063296/photo/conference-room.jpg?s=2048x2048&w=is&k=20&c=Pkze4PuxUP6_GmEycXW0iDKGwYZEu8wlDKM_8fwMp5E='),
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            'data',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
