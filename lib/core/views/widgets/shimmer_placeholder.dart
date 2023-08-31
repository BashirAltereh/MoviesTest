import 'package:flutter/material.dart';
import 'package:golcoin_movies/core/views/widgets/shimmer.dart';
import 'package:sizer/sizer.dart';

/**
 * Shimmer loader like 'Facebook loading'
 */
class CustomShimmer extends StatelessWidget {
  CustomShimmer.normal({
    Key? key,
    this.height,
    this.width,
  })  : _borderRadius = BorderRadius.circular(0),
        super(key: key);

  CustomShimmer.circular({
    Key? key,
    this.height,
    this.width,
  })  : _borderRadius = BorderRadius.circular(20),
        super(key: key);

  CustomShimmer.squarer({
    Key? key,
    this.height,
    this.width,
  })  : _borderRadius = BorderRadius.circular(12),
        super(key: key);

  final double? height;
  final double? width;
  final BorderRadius _borderRadius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300] ?? const Color(0xFF757575),
      highlightColor: Colors.grey[100] ?? const Color(0xFF757575),
      enabled: true,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: _borderRadius,
          color: Colors.white,
        ),
        height: height,
        width: width,
      ),
    );
  }

  static Widget listShimmer() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.w),
      child: Row(
        children: List.generate(
            6,
            (index) => Padding(
                  padding: EdgeInsetsDirectional.only(end: 4.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 22.h, width: 35.w, child: CustomShimmer.circular()),
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Shimmer.fromColors(
                                baseColor: Colors.grey[300] ?? const Color(0xFF757575),
                                highlightColor: Colors.grey[100] ?? const Color(0xFF757575),
                                enabled: true,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 2),
                                  child: Container(
                                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                                    width: 25.w,
                                    height: 8.0,
                                  ),
                                )),
                            Shimmer.fromColors(
                                baseColor: Colors.grey[300] ?? const Color(0xFF757575),
                                highlightColor: Colors.grey[100] ?? const Color(0xFF757575),
                                enabled: true,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 1),
                                  child: Container(
                                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                                    width: 15.w,
                                    height: 8.0,
                                  ),
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
      ),
    );
  }
}
