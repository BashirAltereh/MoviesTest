import 'package:flutter/material.dart';
import 'package:golcoin_movies/core/views/widgets/shimmer.dart';

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
}
