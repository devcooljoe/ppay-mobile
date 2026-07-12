import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/module/kyc/domain/entities/kyc_document_type_entity.dart';
import 'package:ppay_mobile/module/kyc/presentation/providers/kyc_providers.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

class DocumentBottomSheet extends HookConsumerWidget {
  final KycDocumentTypeEntity? selected;
  final ValueChanged<KycDocumentTypeEntity> onSelected;

  const DocumentBottomSheet({
    super.key,
    required this.onSelected,
    this.selected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      Future.microtask(() => ref.read(getKycDocumentTypesProvider.notifier).call());
      return null;
    }, []);

    final state = ref.watch(getKycDocumentTypesProvider);

    return FractionallySizedBox(
      heightFactor: 0.55,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          TouchOpacity(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 60.w,
              width: 60.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30).r,
                color: PPaymobileColors.mainScreenBackground,
              ),
              child: SvgPicture.asset(
                'assets/icon/cancel.svg',
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          10.verticalSpace,
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 12.w, top: 19.h, right: 12.w),
              width: double.infinity,
              decoration: BoxDecoration(
                color: PPaymobileColors.mainScreenBackground,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Select a Document',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: Colors.black,
                    ),
                  ),
                  21.verticalSpace,
                  Expanded(
                    child: state.when(
                      data: (types) {
                        if (types == null || types.isEmpty) {
                          return Center(
                            child: Text(
                              'No document types available',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                fontSize: 14.sp,
                                color: PPaymobileColors.svgIconColor,
                              ),
                            ),
                          );
                        }
                        return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: types.length,
                          itemBuilder: (context, index) {
                            final doc = types[index];
                            final isSelected = selected?.idType == doc.idType;
                            return TouchOpacity(
                              onTap: () {
                                onSelected(doc);
                                Navigator.pop(context);
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: 4.h),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12.w,
                                  vertical: 18.h,
                                ),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? PPaymobileColors.buttonColor
                                          .withValues(alpha: 0.06)
                                      : Colors.transparent,
                                  border: isSelected
                                      ? Border.all(
                                          color: PPaymobileColors.buttonColor,
                                          width: 1.w,
                                        )
                                      : null,
                                  borderRadius: BorderRadius.circular(6.r),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      doc.name,
                                      style: TextStyle(
                                        fontFamily: 'InstrumentSans',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.sp,
                                        color: Colors.black,
                                      ),
                                    ),
                                    if (isSelected)
                                      SizedBox(
                                        height: 20.w,
                                        width: 20.w,
                                        child: SvgPicture.asset(
                                          'assets/icon/check_circle.svg',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      error: (e, _) => Center(
                        child: Text(
                          'Failed to load documents. Tap to retry.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            fontSize: 14.sp,
                            color: PPaymobileColors.svgIconColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  8.verticalSpace,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
