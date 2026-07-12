import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AppImage extends HookWidget {
  final String? imageUrl;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final String? fallbackAsset;

  const AppImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit,
    this.fallbackAsset,
  });

  @override
  Widget build(BuildContext context) {
    final asset = fallbackAsset ?? 'assets/images/profilepic.png';

    if (imageUrl == null || imageUrl!.isEmpty) {
      return Image.asset(
        asset,
        fit: fit ?? BoxFit.cover,
        width: width,
        height: height,
      );
    }

    return CachedNetworkImage(
      imageUrl: imageUrl!,
      fit: fit ?? BoxFit.cover,
      width: width,
      height: height,
      errorListener: (value) {},
      errorWidget: (context, url, error) => Image.asset(
        asset,
        fit: fit ?? BoxFit.cover,
        width: width,
        height: height,
      ),
      placeholder: (context, url) => Image.asset(
        asset,
        fit: fit ?? BoxFit.cover,
        width: width,
        height: height,
      ),
    );
  }
}
