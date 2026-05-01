import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppImage extends StatelessWidget {
  final String? imageUrl;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final String? fallbackUrl;
  const AppImage({super.key, required this.imageUrl, this.width, this.height, this.fit, this.fallbackUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl ?? fallbackUrl ?? "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png",
      errorWidget: (context, url, error) {
        return Image.network('assets/images/account-balance.png', fit: fit, width: width, height: height);
      },
      errorListener: (value) {},
      fit: fit,
      width: width,
      height: height,
    );
  }
}
