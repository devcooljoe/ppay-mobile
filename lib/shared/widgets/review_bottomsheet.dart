import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/core/utils/message_handler.dart';
import 'package:ppay_mobile/module/shopping/presentation/providers/shopping_providers.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';

class ReviewBottomsheet extends HookConsumerWidget {
  final String productId;

  const ReviewBottomsheet({super.key, required this.productId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reviewsState = ref.watch(getProductReviewsProvider);
    final createReviewState = ref.watch(createReviewProvider);
    final selectedRating = useState(0);
    final commentController = useTextEditingController();

    useEffect(() {
      Future.microtask(() => ref.read(getProductReviewsProvider.notifier).call(productId));
      return null;
    }, [productId]);

    Future<void> onSubmitReview() async {
      if (selectedRating.value == 0) {
        MessageHandler.showErrorSnackBar(context, 'Please select a rating');
        return;
      }
      if (commentController.text.trim().isEmpty) {
        MessageHandler.showErrorSnackBar(context, 'Please leave a comment');
        return;
      }
      await ref.read(createReviewProvider.notifier).call(
        productId: productId,
        rating: selectedRating.value,
        comment: commentController.text.trim(),
      );
      if (!context.mounted) return;
      final state = ref.read(createReviewProvider);
      if (state.hasError) {
        MessageHandler.showErrorSnackBar(context, MessageHandler.getErrorMessage(state.error));
      } else {
        commentController.clear();
        selectedRating.value = 0;
        ref.read(getProductReviewsProvider.notifier).call(productId);
        MessageHandler.showSuccessSnackBar(context, 'Review submitted!');
      }
    }

    final reviews = reviewsState.value ?? [];

    return FractionallySizedBox(
      heightFactor: 0.850,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 60.w,
              width: 60.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30).r,
                color: PPaymobileColors.mainScreenBackground,
              ),
              child: SizedBox(
                height: 18.h,
                width: 18.h,
                child: SvgPicture.asset('assets/icon/cancel.svg', fit: BoxFit.scaleDown),
              ),
            ),
          ),
          10.verticalSpace,
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 20.w, top: 29.h, right: 20.w),
              width: double.infinity,
              decoration: BoxDecoration(
                color: PPaymobileColors.mainScreenBackground,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: ListView(
                children: [
                  Text(
                    'Reviews',
                    style: TextStyle(fontFamily: 'InstrumentSans', fontWeight: FontWeight.w500, fontSize: 24.sp, color: Colors.black),
                  ),
                  8.verticalSpace,
                  Text(
                    '${reviews.length} review${reviews.length == 1 ? '' : 's'}',
                    style: TextStyle(fontFamily: 'InstrumentSans', fontWeight: FontWeight.w500, fontSize: 16.sp, color: PPaymobileColors.svgIconColor),
                  ),
                  24.verticalSpace,
                  if (reviewsState.isLoading)
                    const Center(child: CircularProgressIndicator())
                  else if (reviews.isEmpty)
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      child: Text('No reviews yet. Be the first!', style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.svgIconColor, fontSize: 14.sp)),
                    )
                  else
                    ...reviews.map((review) => Padding(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                review.user?.name ?? 'Anonymous',
                                style: TextStyle(fontFamily: 'InstrumentSans', fontWeight: FontWeight.w600, fontSize: 16.sp, color: Colors.black),
                              ),
                              Row(
                                children: List.generate(5, (i) => Icon(
                                  i < review.rating ? Icons.star : Icons.star_border,
                                  color: const Color(0xFFFFC107),
                                  size: 16.w,
                                )),
                              ),
                            ],
                          ),
                          8.verticalSpace,
                          Text(
                            review.comment,
                            style: TextStyle(fontFamily: 'InstrumentSans', fontWeight: FontWeight.w500, fontSize: 14.sp, color: Colors.black),
                          ),
                          16.verticalSpace,
                          Divider(color: PPaymobileColors.textfiedBorder, thickness: 1.h),
                        ],
                      ),
                    )),
                  40.verticalSpace,
                  Text(
                    'Rate Product',
                    style: TextStyle(fontFamily: 'InstrumentSans', fontWeight: FontWeight.w600, fontSize: 20.sp, color: Colors.black),
                  ),
                  16.verticalSpace,
                  Row(
                    children: List.generate(5, (i) => GestureDetector(
                      onTap: () => selectedRating.value = i + 1,
                      child: Padding(
                        padding: EdgeInsets.only(right: 8.w),
                        child: Icon(
                          i < selectedRating.value ? Icons.star : Icons.star_border,
                          color: const Color(0xFFFFC107),
                          size: 32.w,
                        ),
                      ),
                    )),
                  ),
                  20.verticalSpace,
                  Text(
                    'Leave Review',
                    style: TextStyle(fontFamily: 'InstrumentSans', fontWeight: FontWeight.w500, fontSize: 16.sp, color: Colors.black),
                  ),
                  12.verticalSpace,
                  Container(
                    height: 120.h,
                    padding: EdgeInsets.all(12).r,
                    decoration: BoxDecoration(
                      color: PPaymobileColors.deepBackgroundColor,
                      borderRadius: BorderRadius.circular(6).r,
                    ),
                    child: TextFormField(
                      controller: commentController,
                      maxLines: 4,
                      decoration: InputDecoration(
                        hintText: 'Leave a comment...',
                        hintStyle: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.svgIconColor, fontSize: 14.sp),
                        border: const OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  20.verticalSpace,
                  GestureDetector(
                    onTap: createReviewState.isLoading ? null : onSubmitReview,
                    child: Container(
                      height: 48.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(56).r,
                        color: PPaymobileColors.buttonColorandText,
                      ),
                      child: Center(
                        child: Text(
                          createReviewState.isLoading ? 'Submitting...' : 'Submit Review',
                          style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                  24.verticalSpace,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
