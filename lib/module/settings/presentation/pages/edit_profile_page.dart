import 'package:flutter/material.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ppay_mobile/core/utils/message_handler.dart';
import 'package:ppay_mobile/module/auth/presentation/providers/auth_providers.dart';
import 'package:ppay_mobile/module/kyc/presentation/providers/kyc_providers.dart';
import 'package:ppay_mobile/shared/widgets/app_image.dart';
import 'package:ppay_mobile/shared/widgets/app_loader.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/custom_date_picker.dart';
import 'package:ppay_mobile/shared/widgets/gender_bottomsheet.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/pp_label.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';

@RoutePage()
class EditProfilePage extends HookConsumerWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authenticatedUserProvider).value;

    final nameController = useTextEditingController(text: user?.fullName ?? '');
    final dateController = useTextEditingController(
      text: user?.dob != null ? _formatDobForDisplay(user!.dob!) : '',
    );
    final genderController = useTextEditingController();
    final selectedDob = useState<String?>(user?.dob);

    ref.listen(updateProfileProvider, (_, next) {
      if (next.isLoading) {
        AppLoader.show(context);
      } else {
        AppLoader.hide(context);
        if (next.hasError) {
          MessageHandler.showErrorSnackBar(context, next.error.toString());
        } else if (!next.isLoading) {
          ref.read(authenticatedUserProvider.notifier).silentRefresh();
          MessageHandler.showSuccessSnackBar(context, 'Profile updated successfully');
          Navigator.pop(context);
        }
      }
    });

    ref.listen(uploadProfilePictureProvider, (_, next) {
      if (next.isLoading) {
        AppLoader.show(context);
      } else {
        AppLoader.hide(context);
        if (next.hasError) {
          MessageHandler.showErrorSnackBar(context, next.error.toString());
        } else if (!next.isLoading) {
          MessageHandler.showSuccessSnackBar(context, 'Profile picture updated');
        }
      }
    });

    Future<void> pickAndUploadImage() async {
      final picker = ImagePicker();
      final picked = await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
      if (picked != null) {
        await ref.read(uploadProfilePictureProvider.notifier).call(picked.path);
      }
    }

    void handleSave() {
      final name = nameController.text.trim();
      final dob = selectedDob.value;
      if (name.isEmpty && dob == null) {
        MessageHandler.showErrorSnackBar(context, 'Please update at least one field');
        return;
      }
      ref.read(updateProfileProvider.notifier).call(
            fullName: name.isNotEmpty ? name : null,
            dob: dob,
          );
    }

    final picture = user?.picture;
    final initials = _initials(user?.fullName ?? '');

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: PPAppBar(
        title: 'Profile',
        onBackPressed: () => Navigator.pop(context),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: TouchOpacity(
              onTap: () {
                nameController.text = user?.fullName ?? '';
                dateController.text = user?.dob != null ? _formatDobForDisplay(user!.dob!) : '';
                selectedDob.value = user?.dob;
              },
              child: Text(
                'Reset',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: PPaymobileColors.doneTextColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20).w,
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  51.verticalSpace,
                  GestureDetector(
                    onTap: pickAndUploadImage,
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 51.5.r,
                          backgroundColor: PPaymobileColors.backgroundColor,
                          child: picture != null && picture.isNotEmpty
                              ? ClipOval(
                                  child: AppImage(
                                    imageUrl: picture,
                                    width: 103.w,
                                    height: 103.w,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : Text(
                                  initials,
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: PPaymobileColors.mainScreenBackground,
                                    fontSize: 28.sp,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 28.w,
                            width: 28.w,
                            decoration: BoxDecoration(
                              color: PPaymobileColors.buttonColorandText,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                'assets/icon/camera.svg',
                                width: 14.w,
                                height: 14.w,
                                fit: BoxFit.contain,
                                colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  8.verticalSpace,
                  TouchOpacity(
                    onTap: pickAndUploadImage,
                    child: Container(
                      height: 40.h,
                      width: 134.w,
                      padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 8.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6).r,
                        border: Border.all(width: 1.w, color: PPaymobileColors.textfiedBorder),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 14.h,
                            width: 15.w,
                            child: SvgPicture.asset('assets/icon/camera.svg', fit: BoxFit.contain),
                          ),
                          6.horizontalSpace,
                          Text(
                            'Add Image',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: Colors.black,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  61.verticalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const PPLabel(text: 'Full Name'),
                      4.verticalSpace,
                      Container(
                        height: 52.h,
                        width: double.infinity,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(6).r),
                        child: TextFormField(
                          controller: nameController,
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
                            hintText: 'Full Name',
                            hintStyle: TextStyle(
                              fontFamily: 'InstrumentSans',
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              color: PPaymobileColors.textfiedBorder,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.r),
                              borderSide: BorderSide(color: PPaymobileColors.textfiedBorder, width: 1.w),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.r),
                              borderSide: BorderSide(color: PPaymobileColors.textfiedBorder, width: 1.w),
                            ),
                          ),
                        ),
                      ),
                      24.verticalSpace,
                      const PPLabel(text: 'Date of Birth'),
                      4.verticalSpace,
                      TextFormField(
                        controller: dateController,
                        readOnly: true,
                        onTap: () async {
                          final picked = await showDialog<DateTime>(
                            context: context,
                            builder: (_) => const CustomDatePickerDialog(),
                          );
                          if (picked != null) {
                            dateController.text =
                                '${picked.day.toString().padLeft(2, '0')}/'
                                '${picked.month.toString().padLeft(2, '0')}/'
                                '${picked.year}';
                            selectedDob.value =
                                '${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}';
                          }
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
                          hintText: 'DD/MM/YYYY',
                          hintStyle: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: PPaymobileColors.textfiedBorder,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          suffixIcon: SizedBox(
                            height: 24.w,
                            width: 24.w,
                            child: SvgPicture.asset('assets/icon/calendar.svg', fit: BoxFit.scaleDown),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.r),
                            borderSide: BorderSide(color: PPaymobileColors.textfiedBorder, width: 1.w),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.r),
                            borderSide: BorderSide(color: PPaymobileColors.textfiedBorder, width: 1.w),
                          ),
                        ),
                      ),
                      24.verticalSpace,
                      const PPLabel(text: 'Gender'),
                      4.verticalSpace,
                      TouchOpacity(
                        onTap: () async {
                          final result = await showModalBottomSheet<String>(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (_) => const GenderBottomsheet(),
                          );
                          if (result != null) genderController.text = result;
                        },
                        child: Container(
                          height: 52.h,
                          width: double.infinity,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(6).r),
                          child: TextFormField(
                            controller: genderController,
                            readOnly: true,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
                              hintText: 'Select',
                              hintStyle: TextStyle(
                                fontFamily: 'InstrumentSans',
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                                color: PPaymobileColors.textfiedBorder,
                              ),
                              suffixIcon: TouchOpacity(
                                onTap: () async {
                                  final result = await showModalBottomSheet<String>(
                                    context: context,
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    builder: (_) => const GenderBottomsheet(),
                                  );
                                  if (result != null) genderController.text = result;
                                },
                                child: SizedBox(
                                  height: 14.h,
                                  width: 8.w,
                                  child: SvgPicture.asset('assets/icon/arrow_down.svg', fit: BoxFit.scaleDown),
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6.r),
                                borderSide: BorderSide(color: PPaymobileColors.textfiedBorder, width: 1.w),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6.r),
                                borderSide: BorderSide(color: PPaymobileColors.textfiedBorder, width: 1.w),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              77.verticalSpace,
              PPButton(text: 'Save Changes', onPressed: handleSave),
            ],
          ),
        ),
      ),
    );
  }

  String _initials(String name) {
    final parts = name.trim().split(' ');
    if (parts.isEmpty) return '';
    if (parts.length == 1) return parts[0].substring(0, 1).toUpperCase();
    return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
  }

  String _formatDobForDisplay(String dob) {
    try {
      final parts = dob.split('-');
      if (parts.length != 3) return dob;
      return '${parts[2]}/${parts[1]}/${parts[0]}';
    } catch (_) {
      return dob;
    }
  }
}
