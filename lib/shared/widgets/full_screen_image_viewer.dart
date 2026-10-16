import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A full-screen image viewer that supports pinch-to-zoom, swiping between
/// multiple images, a close button, and a page indicator.
class FullScreenImageViewer extends HookWidget {
  final List<String> imageUrls;
  final int initialIndex;

  const FullScreenImageViewer({
    super.key,
    required this.imageUrls,
    this.initialIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState(initialIndex);
    final pageController = usePageController(initialPage: initialIndex);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PageView.builder(
            controller: pageController,
            onPageChanged: (i) => currentIndex.value = i,
            itemCount: imageUrls.length,
            itemBuilder: (context, index) => InteractiveViewer(
              minScale: 0.5,
              maxScale: 4.0,
              child: Center(
                child: CachedNetworkImage(
                  imageUrl: imageUrls[index],
                  fit: BoxFit.contain,
                  placeholder: (_, __) => const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                  errorWidget: (_, __, ___) => const Icon(
                    Icons.broken_image_outlined,
                    color: Colors.white54,
                    size: 64,
                  ),
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(12.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      height: 36.w,
                      width: 36.w,
                      decoration: const BoxDecoration(
                        color: Colors.black54,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.close, color: Colors.white, size: 20.w),
                    ),
                  ),
                  if (imageUrls.length > 1)
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        '${currentIndex.value + 1} / ${imageUrls.length}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.sp,
                          fontFamily: 'InstrumentSans',
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Opens the full-screen image viewer with a fade transition.
  static void show(
    BuildContext context, {
    required List<String> imageUrls,
    int initialIndex = 0,
  }) {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        barrierColor: Colors.black,
        pageBuilder: (_, __, ___) => FullScreenImageViewer(
          imageUrls: imageUrls,
          initialIndex: initialIndex,
        ),
        transitionsBuilder: (_, animation, __, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    );
  }
}
