import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

class PPTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool readOnly;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final Widget? hint;
  final ValueChanged<String>? onChanged;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;

  /// When true, the field manages its own obscure state and renders a
  /// tappable eye toggle as the suffix icon. The eye icon is recolored so it
  /// is visible on the white field background. When set, [obscureText] and
  /// [suffixIcon] passed by callers are ignored, and the prefix defaults to
  /// the lock icon unless a [prefixIcon] is supplied.
  final bool isPassword;

  const PPTextField({
    super.key,
    this.controller,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.readOnly = false,
    this.onTap,
    this.validator,
    this.keyboardType,
    this.hint,
    this.onChanged,
    this.maxLength,
    this.inputFormatters,
    this.isPassword = false,
  });

  @override
  State<PPTextField> createState() => _PPTextFieldState();
}

class _PPTextFieldState extends State<PPTextField> {
  /// Visible tone matching the lock prefix / lock_eye assets so the
  /// white-fill `eye-slash.svg` renders visibly on the white field.
  static const Color _iconColor = Color(0xFF41416E);

  late bool _obscure;

  @override
  void initState() {
    super.initState();
    // Password fields always start obscured; non-password fields honor the
    // caller-provided value.
    _obscure = widget.isPassword ? true : widget.obscureText;
  }

  @override
  void didUpdateWidget(covariant PPTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Keep non-password fields in sync if the caller changes obscureText.
    if (!widget.isPassword && widget.obscureText != oldWidget.obscureText) {
      _obscure = widget.obscureText;
    }
  }

  Widget _buildPasswordToggle() {
    return TouchOpacity(
      onTap: () => setState(() => _obscure = !_obscure),
      child: Padding(
        padding: const EdgeInsets.all(14.0).r,
        child: SvgPicture.asset(
          _obscure ? 'assets/icon/eye-slash.svg' : 'assets/icon/lock_eye.svg',
          colorFilter: const ColorFilter.mode(_iconColor, BlendMode.srcIn),
        ),
      ),
    );
  }

  Widget? _buildPrefixIcon() {
    if (widget.prefixIcon != null) return widget.prefixIcon;
    if (widget.isPassword) {
      return Padding(
        padding: const EdgeInsets.all(14.0).r,
        child: SvgPicture.asset('assets/icon/lock.svg'),
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final bool effectiveObscure =
        widget.isPassword ? _obscure : widget.obscureText;
    final Widget? effectiveSuffix =
        widget.isPassword ? _buildPasswordToggle() : widget.suffixIcon;

    return TextFormField(
      controller: widget.controller,
      obscureText: effectiveObscure,
      readOnly: widget.readOnly,
      onTap: widget.onTap,
      onChanged: widget.onChanged,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      maxLength: widget.maxLength,
      inputFormatters: widget.inputFormatters,
      style: TextStyle(
        fontFamily: 'InstrumentSans',
        fontSize: 16.sp,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
        prefixIcon: _buildPrefixIcon(),
        suffixIcon: effectiveSuffix,
        hintText: widget.hintText,
        hint: widget.hint,
        counterText: '',
        hintStyle: TextStyle(
          fontFamily: 'InstrumentSans',
          fontWeight: FontWeight.w400,
          fontSize: 16.sp,
          fontStyle: FontStyle.italic,
          color: PPaymobileColors.svgIconColor,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.r),
          borderSide: BorderSide(color: PPaymobileColors.lightGrey, width: 1.w),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.r),
          borderSide: BorderSide(color: PPaymobileColors.lightGrey, width: 1.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.r),
          borderSide: BorderSide(
            color: PPaymobileColors.buttonColor,
            width: 1.5.w,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.r),
          borderSide: BorderSide(
            color: PPaymobileColors.redTextfield,
            width: 1.w,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.r),
          borderSide: BorderSide(
            color: PPaymobileColors.redTextfield,
            width: 1.5.w,
          ),
        ),
        errorStyle: TextStyle(
          fontFamily: 'InstrumentSans',
          fontSize: 12.sp,
          color: PPaymobileColors.redTextfield,
        ),
      ),
    );
  }
}
