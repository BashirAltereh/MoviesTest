import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:golcoin_movies/core/views/widgets/shimmer_placeholder.dart';

class ImageView extends StatelessWidget {
  final String imageUrl;

  const ImageView({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return imageProviderForWeb();
    } else {
      return imageProviderForMobile(context);
    }
  }

  Widget imageProviderForWeb() {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) return child;
          return CustomShimmer.squarer();
        },
      ),
    );
  }

  Widget imageProviderForMobile(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        placeholder: (context, url) => CustomShimmer.squarer(),
        errorWidget: (context, url, error) => errorPlaceholder(),
      ),
    );
  }

  Widget errorPlaceholder() {
    return const SizedBox();
  }
}
