import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/crypto_bottomsheet.dart';
import 'package:ppay_mobile/screens/widgets/crypto_puurchase_bottomsheet.dart';
import 'package:ppay_mobile/screens/widgets/custom_keyboard.dart';
import 'package:ppay_mobile/screens/widgets/custom_keyboard_container.dart';

class BuyCrypto extends StatefulWidget {
  const BuyCrypto({super.key});

  @override
  State<BuyCrypto> createState() => _BuyCryptoState();
}

class _BuyCryptoState extends State<BuyCrypto> {
  final FocusNode _focusNode = FocusNode(canRequestFocus: false);

  final TextEditingController _controller = TextEditingController();
  bool _showKeyboard = false;

  void _onKeyTap(String value) {
    setState(() {
      // Prevent multiple dots
      if (value == '.' && _controller.text.contains('.')) return;
      // Prevent dot at start
      if (value == '.' && _controller.text.isEmpty) return;

      _controller.text += value;
    });
  }

  // Handle delete key
  void _onDelete() {
    setState(() {
      if (_controller.text.isNotEmpty) {
        _controller.text = _controller.text.substring(
          0,
          _controller.text.length - 1,
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: AppBar(
        backgroundColor: PPaymobileColors.mainScreenBackground,
        toolbarHeight: 56,
        leadingWidth: 56.w,
        centerTitle: true,
        title: Text(
          'Buy Crypto',
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: SizedBox(
              height: 24.h,
              width: 24.w,
              child: SvgPicture.asset(
                'assets/icon/arrow_back.svg',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    setState(() {
                      _showKeyboard = false;
                    });
                  },
                  child: ListView(
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    children: [
                      37.verticalSpace,
                      Align(
                        alignment: Alignment.center,
                        child: IntrinsicWidth(
                          child: Container(
                            height: 23.h,
                            padding: EdgeInsets.symmetric(horizontal: 17.w),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: PPaymobileColors.textfiedBorder,
                                width: 1.w,
                              ),
                              borderRadius: BorderRadius.circular(12).r,
                              color: PPaymobileColors.mainScreenBackground,
                            ),
                            child: Center(
                              child: RichText(
                                text: TextSpan(
                                  text: 'Wallet Balance: ',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: PPaymobileColors.svgIconColor,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: '₦689,098.00',
                                      style: TextStyle(
                                        fontFamily: 'InstrumentSans',
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      20.verticalSpace,
                      Center(
                        child: RichText(
                          text: TextSpan(
                            text: '₦',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: Colors.black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            children: [
                              TextSpan(
                                text: '0',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: Colors.black,
                                  fontSize: 48.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: '.00',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: Colors.black,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      10.verticalSpace,
                      Center(
                        child: RichText(
                          text: TextSpan(
                            text: 'Min: ',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: Colors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            children: [
                              TextSpan(
                                text: '0.000020BTC',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: Colors.black,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      45.verticalSpace,
                      Text(
                        'You Get',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      4.verticalSpace,
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _showKeyboard = true;
                          });
                        },
                        child: SizedBox(
                          height: 68.h,
                          width: double.infinity,
                          child: TextFormField(
                            controller: _controller,
                            readOnly: true,
                            showCursor: true,
                            onTap: () {
                              setState(() {
                                _showKeyboard = true;
                              });
                            },
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16.0.w,
                                  vertical: 12.h,
                                ),
                                child: Container(
                                  height: 44.h,
                                  width: 95.w,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12.w,
                                    vertical: 4.h,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(37).r,
                                    color: PPaymobileColors.deepBackgroundColor,
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 36.h,
                                        width: 36.w,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: AssetImage(
                                              'assets/images/bitcoin.png',
                                            ),
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                      11.horizontalSpace,
                                      GestureDetector(
                                        onTap: () async {
                                          final bank =
                                              await showModalBottomSheet(
                                                context: context,
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                builder: (_) =>
                                                    const CryptoBottomsheet(),
                                              );
                                        },
                                        child: SizedBox(
                                          height: 12.h,
                                          width: 24.w,
                                          child: SvgPicture.asset(
                                            'assets/icon/arrow_down.svg',
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              hintText: '0.0000',
                              hintStyle: TextStyle(
                                fontFamily: 'Gilroy',
                                fontWeight: FontWeight.w400,
                                fontSize: 16.sp,
                                color: PPaymobileColors.svgIconColor,
                              ),
                              suffixIcon: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8.0.w,
                                  vertical: 20.h,
                                ),
                                child: SizedBox(
                                  height: 26.h,
                                  width: 36.w,
                                  child: Text(
                                    'BTC',
                                    style: TextStyle(
                                      fontFamily: 'InstrumentSans',
                                      color: Colors.black,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1.w,
                                  color: PPaymobileColors.textfiedBorder,
                                ),
                                borderRadius: BorderRadius.circular(6).r,
                              ),
                            ),
                          ),
                        ),
                      ),
                      6.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '1 BTC',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: PPaymobileColors.svgIconColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              6.horizontalSpace,
                              SizedBox(
                                height: 17.h,
                                width: 17.w,
                                child: SvgPicture.asset(
                                  'assets/icon/swap.svg',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              6.horizontalSpace,
                              Text(
                                '₦13,000,000.00',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: PPaymobileColors.svgIconColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          RichText(
                            text: TextSpan(
                              text: 'Fee: ',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: PPaymobileColors.svgIconColor,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                              ),
                              children: [
                                TextSpan(
                                  text: '₦0.00',
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
                        ],
                      ),
                      236.verticalSpace,
                      SizedBox(
                        width: double.infinity,
                        height: 54.h,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: PPaymobileColors.backgroundColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(42),
                            ),
                          ),
                          onPressed: () async {
                            final bank = await showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (_) =>
                                  const CryptoPuurchaseBottomsheet(),
                            );
                          },
                          child: Text(
                            'Buy',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                              color: PPaymobileColors.mainScreenBackground,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              height: _showKeyboard ? 424.h : 0,
              child: _showKeyboard
                  ? KeyboardContainer(
                      child: CustomKeyboard(
                        onKeyTap: _onKeyTap,
                        onDelete: _onDelete,
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
