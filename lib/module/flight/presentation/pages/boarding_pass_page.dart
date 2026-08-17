import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:auto_route/auto_route.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ppay_mobile/module/flight/domain/entities/flight_entity.dart';
import 'package:ppay_mobile/module/flight/presentation/providers/flight_providers.dart';
import 'package:ppay_mobile/module/flight/presentation/providers/selected_flight_provider.dart';
import 'package:ppay_mobile/module/flight/presentation/utils/flight_format_utils.dart';
import 'package:ppay_mobile/shared/widgets/app_image.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/skeleton_loader.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';
import 'package:share_plus/share_plus.dart';

@RoutePage()
class BoardingPassPage extends HookConsumerWidget {
  final String? bookingReference;
  const BoardingPassPage({super.key, this.bookingReference});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final isOpaque = useState(false);
    final boardingPassAsync = ref.watch(getBoardingPassProvider);
    final bookingResult = ref.watch(flightBookingResultProvider);
    final cardKey = useMemoized(() => GlobalKey(), []);
    final isCapturing = useState(false);

    useEffect(() {
      void listener() => isOpaque.value = scrollController.offset >= 20;
      scrollController.addListener(listener);
      return () => scrollController.removeListener(listener);
    }, [scrollController]);

    useEffect(() {
      final ref_ = bookingReference ?? bookingResult?.bookingReference;
      if (ref_ != null && ref_.isNotEmpty) {
        Future.microtask(
          () => ref.read(getBoardingPassProvider.notifier).call(ref_),
        );
      }
      return null;
    }, [bookingReference, bookingResult?.bookingReference]);

    return Scaffold(
      backgroundColor: PPaymobileColors.buttonColorandText,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        animateColor: true,
        backgroundColor: isOpaque.value
            ? PPaymobileColors.buttonColorandText
            : Colors.transparent,
        centerTitle: true,
        title: Text(
          'Boarding Pass',
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: PPaymobileColors.mainScreenBackground,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: TouchOpacity(
            onTap: () => Navigator.pop(context),
            child: SizedBox(
              height: 24.w,
              width: 24.w,
              child: SvgPicture.asset(
                'assets/icon/arrow_back_white.svg',
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ),
      ),
      body: boardingPassAsync.when(
        loading: () => Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                width: ScreenUtil().screenWidth,
                height: ScreenUtil().screenHeight * 0.5,
                color: Colors.white,
              ),
            ),
            Center(
              child: SkeletonLoader(
                width: 390.w,
                height: 600.h,
                borderRadius: BorderRadius.circular(21.r),
              ),
            ),
          ],
        ),
        error: (e, _) => Center(
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  e.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    fontSize: 14.sp,
                    color: PPaymobileColors.svgIconColor,
                  ),
                ),
                24.verticalSpace,
                TouchOpacity(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    height: 46.h,
                    width: 200.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(56).r,
                      color: PPaymobileColors.buttonColorandText,
                    ),
                    child: Center(
                      child: Text(
                        'Go Back',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        data: (boardingPass) {
          if (boardingPass == null) {
            return Stack(
              children: [
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: ScreenUtil().screenWidth,
                    height: ScreenUtil().screenHeight * 0.5,
                    color: Colors.white,
                  ),
                ),
                Center(
                  child: Text(
                    'No boarding pass available',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.white,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ],
            );
          }
          return Stack(
            children: [
              Positioned(
                bottom: 0,
                child: Container(
                  width: ScreenUtil().screenWidth,
                  height: ScreenUtil().screenHeight * 0.5,
                  color: Colors.white,
                ),
              ),
              SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 50.h),
                      width: double.infinity,
                      height: ScreenUtil().screenHeight * 0.05,
                      color: PPaymobileColors.buttonColorandText,
                      child: Image.asset(
                        'assets/images/flight_bg.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    90.verticalSpace,
                    Center(
                      child: _BoardingPassCard(
                        boardingPass: boardingPass,
                        cardKey: cardKey,
                      ),
                    ),
                    45.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TouchOpacity(
                            onTap: isCapturing.value
                                ? null
                                : () => _handleDownload(
                                    context,
                                    cardKey,
                                    isCapturing,
                                  ),
                            child: Container(
                              height: 46.h,
                              width: 190.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(65).r,
                                color: PPaymobileColors.buttonColorandText,
                              ),
                              child: isCapturing.value
                                  ? Center(
                                      child: SizedBox(
                                        height: 18.w,
                                        width: 18.w,
                                        child: const CircularProgressIndicator(
                                          strokeWidth: 2,
                                          valueColor: AlwaysStoppedAnimation(
                                            Colors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 24.h,
                                          width: 24.h,
                                          child: SvgPicture.asset(
                                            'assets/icon/dbt.svg',
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        12.horizontalSpace,
                                        Text(
                                          'Download',
                                          style: TextStyle(
                                            fontFamily: 'InstrumentSans',
                                            color: PPaymobileColors
                                                .mainScreenBackground,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                            ),
                          ),
                          TouchOpacity(
                            onTap: isCapturing.value
                                ? null
                                : () => _handleShare(
                                    context,
                                    cardKey,
                                    isCapturing,
                                    boardingPass,
                                  ),
                            child: Container(
                              height: 46.h,
                              width: 190.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(65).r,
                                color: PPaymobileColors.mainScreenBackground,
                                border: Border.all(
                                  color: PPaymobileColors.textfieldGrey,
                                  width: 1.w,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 24.h,
                                    width: 24.h,
                                    child: SvgPicture.asset(
                                      'assets/icon/share_2.svg',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  12.horizontalSpace,
                                  Text(
                                    'Share',
                                    style: TextStyle(
                                      fontFamily: 'InstrumentSans',
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    32.verticalSpace,
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<Uint8List?> _captureCard(GlobalKey key) async {
    try {
      final boundary =
          key.currentContext?.findRenderObject() as RenderRepaintBoundary?;
      if (boundary == null) return null;
      final image = await boundary.toImage(pixelRatio: 3.0);
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      return byteData?.buffer.asUint8List();
    } catch (_) {
      return null;
    }
  }

  Future<void> _handleShare(
    BuildContext context,
    GlobalKey key,
    ValueNotifier<bool> isCapturing,
    BoardingPassEntity boardingPass,
  ) async {
    isCapturing.value = true;
    try {
      final bytes = await _captureCard(key);
      if (bytes == null) return;
      final dir = await getTemporaryDirectory();
      final file = File(
        '${dir.path}/boarding_pass_${boardingPass.bookingReference}.png',
      );
      await file.writeAsBytes(bytes);
      await Share.shareXFiles(
        [XFile(file.path, mimeType: 'image/png')],
        text:
            'Boarding Pass — ${boardingPass.bookingReference}\n${boardingPass.origin} → ${boardingPass.destination}',
      );
    } finally {
      isCapturing.value = false;
    }
  }

  Future<void> _handleDownload(
    BuildContext context,
    GlobalKey key,
    ValueNotifier<bool> isCapturing,
  ) async {
    isCapturing.value = true;
    try {
      final bytes = await _captureCard(key);
      if (bytes == null) return;
      final dir = await getTemporaryDirectory();
      final file = File(
        '${dir.path}/boarding_pass_${DateTime.now().millisecondsSinceEpoch}.png',
      );
      await file.writeAsBytes(bytes);
      await Share.shareXFiles([
        XFile(file.path, mimeType: 'image/png'),
      ], subject: 'Boarding Pass');
    } finally {
      isCapturing.value = false;
    }
  }
}

// ─── Card wrapper ─────────────────────────────────────────────────────────────

class _BoardingPassCard extends StatefulWidget {
  final BoardingPassEntity boardingPass;
  final GlobalKey cardKey;
  const _BoardingPassCard({required this.boardingPass, required this.cardKey});

  @override
  State<_BoardingPassCard> createState() => _BoardingPassCardState();
}

class _BoardingPassCardState extends State<_BoardingPassCard> {
  double _topNotchY = 0;
  double _bottomNotchY = 0;
  final _contentKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _measureNotches());
  }

  void _measureNotches() {
    final box = _contentKey.currentContext?.findRenderObject() as RenderBox?;
    if (box == null) return;
    final h = box.size.height;
    setState(() {
      _topNotchY = h * 0.38;
      _bottomNotchY = h * 0.78;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400.w,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Align(
            alignment: Alignment.center,
            child: RepaintBoundary(
              key: widget.cardKey,
              child: Container(
                key: _contentKey,
                width: 390.w,
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                decoration: BoxDecoration(
                  color: PPaymobileColors.mainScreenBackground,
                  borderRadius: BorderRadius.circular(21.r),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 0),
                      blurRadius: 3.r,
                      color: const Color(0xffD9D9D9),
                      blurStyle: BlurStyle.outer,
                    ),
                  ],
                ),
                child: _BoardingPassContent(boardingPass: widget.boardingPass),
              ),
            ),
          ),
          if (_topNotchY > 0) ...[
            _Notch(top: _topNotchY, right: false),
            _Notch(top: _topNotchY, right: true),
          ],
          if (_bottomNotchY > 0) ...[
            _Notch(top: _bottomNotchY, right: false),
            _Notch(top: _bottomNotchY, right: true),
          ],
        ],
      ),
    );
  }
}

class _Notch extends StatelessWidget {
  final double top;
  final bool right;
  const _Notch({required this.top, required this.right});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: right ? null : -15.w,
      right: right ? -15.w : null,
      top: top - 16.w,
      child: Container(
        height: 32.w,
        width: 32.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Colors.white,
          border: Border.all(
            width: 1.w,
            color: PPaymobileColors.deepBackgroundColor,
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 0),
              blurRadius: 1.r,
              color: const Color(0xffD9D9D9),
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Main content ─────────────────────────────────────────────────────────────

class _BoardingPassContent extends StatelessWidget {
  final BoardingPassEntity boardingPass;
  const _BoardingPassContent({required this.boardingPass});

  @override
  Widget build(BuildContext context) {
    final isRoundTrip = boardingPass.inbound.isNotEmpty;
    final isReserved = boardingPass.status.toLowerCase() == 'reserved';
    final barcodeData = boardingPass.tickets.isNotEmpty
        ? boardingPass.tickets.first.ticketNumber
        : boardingPass.bookingReference;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // ── Airline header ──────────────────────────────────────────────────
        Container(
          height: 72.h,
          width: 72.h,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
          child: AppImage(
            imageUrl: boardingPass.airlineLogo,
            width: 72.w,
            height: 72.w,
            fit: BoxFit.contain,
          ),
        ),
        6.verticalSpace,
        Text(
          boardingPass.airline,
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: PPaymobileColors.svgIconColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        2.verticalSpace,
        Text(
          boardingPass.flightNumber,
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: PPaymobileColors.svgIconColor,
            fontSize: 10.sp,
            fontWeight: FontWeight.w500,
          ),
        ),

        // ── Expiry warning ──────────────────────────────────────────────────
        if (isReserved &&
            boardingPass.expiresAt != null &&
            boardingPass.expiresAt!.isNotEmpty) ...[
          12.verticalSpace,
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: PPaymobileColors.warningColor,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.access_time_rounded,
                  size: 14.sp,
                  color: PPaymobileColors.warningTextColor,
                ),
                6.horizontalSpace,
                Expanded(
                  child: Text(
                    'Reserved until ${FlightFormatUtils.formatDate(boardingPass.expiresAt!)} · ${FlightFormatUtils.formatTime(boardingPass.expiresAt!)}',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.warningTextColor,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],

        24.verticalSpace,
        SizedBox(
          height: 3.h,
          width: double.infinity,
          child: SvgPicture.asset(
            'assets/icon/dashed_3.svg',
            fit: BoxFit.contain,
          ),
        ),
        24.verticalSpace,

        // ── Route ───────────────────────────────────────────────────────────
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  boardingPass.origin,
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: Colors.black,
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                4.verticalSpace,
                Text(
                  'DEPARTURE',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: PPaymobileColors.anotherGreyColor,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 119.w,
              height: 73.h,
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  SvgPicture.asset('assets/icon/crmeter.svg'),
                  Positioned(
                    bottom: 16,
                    child: SvgPicture.asset(
                      'assets/icon/airplane_g.svg',
                      width: 24.w,
                      height: 24.w,
                    ),
                  ),
                  Positioned(
                    bottom: 0.h,
                    child: Text(
                      FlightFormatUtils.formatDuration(boardingPass.duration),
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: Colors.black,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  boardingPass.destination,
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: Colors.black,
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                4.verticalSpace,
                Text(
                  'ARRIVAL',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: PPaymobileColors.anotherGreyColor,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),

        20.verticalSpace,

        // ── Time / Date ─────────────────────────────────────────────────────
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _InfoBox(
              icon: 'assets/icon/time_b.svg',
              label: 'Time',
              value:
                  '${FlightFormatUtils.formatTime(boardingPass.departureTime)} – ${FlightFormatUtils.formatTime(boardingPass.arrivalTime)}',
            ),
            _InfoBox(
              icon: 'assets/icon/calendar.svg',
              label: 'Date',
              value: FlightFormatUtils.formatDate(boardingPass.departureTime),
            ),
          ],
        ),

        20.verticalSpace,

        // ── Detail row ──────────────────────────────────────────────────────
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _DetailItem(label: 'Flight', value: boardingPass.flightNumber),
            _DetailItem(label: 'Class', value: boardingPass.cabinClass),
            _DetailItem(label: 'Booking', value: boardingPass.bookingClass),
            _DetailItem(
              label: 'Status',
              value: _capitalise(boardingPass.status),
              valueColor: _statusColor(boardingPass.status),
            ),
          ],
        ),

        16.verticalSpace,

        // ── Provider ref ────────────────────────────────────────────────────
        Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Provider Ref',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: PPaymobileColors.anotherGreyColor,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              2.verticalSpace,
              Text(
                boardingPass.providerReference,
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),

        24.verticalSpace,
        SizedBox(
          height: 3.h,
          width: double.infinity,
          child: SvgPicture.asset(
            'assets/icon/dashed_3.svg',
            fit: BoxFit.contain,
          ),
        ),
        20.verticalSpace,

        // ── Outbound segments ───────────────────────────────────────────────
        if (boardingPass.outbound.isNotEmpty) ...[
          _SectionHeader(
            label: isRoundTrip ? 'Outbound Segments' : 'Flight Segments',
          ),
          10.verticalSpace,
          ...boardingPass.outbound.asMap().entries.map(
            (e) => _SegmentRow(
              segment: e.value,
              index: e.key,
              total: boardingPass.outbound.length,
            ),
          ),
          16.verticalSpace,
        ],

        // ── Inbound segments ────────────────────────────────────────────────
        if (isRoundTrip) ...[
          SizedBox(
            height: 3.h,
            width: double.infinity,
            child: SvgPicture.asset(
              'assets/icon/dashed_3.svg',
              fit: BoxFit.contain,
            ),
          ),
          20.verticalSpace,
          _SectionHeader(label: 'Return Segments'),
          10.verticalSpace,
          ...boardingPass.inbound.asMap().entries.map(
            (e) => _SegmentRow(
              segment: e.value,
              index: e.key,
              total: boardingPass.inbound.length,
            ),
          ),
          16.verticalSpace,
        ],

        SizedBox(
          height: 3.h,
          width: double.infinity,
          child: SvgPicture.asset(
            'assets/icon/dashed_3.svg',
            fit: BoxFit.contain,
          ),
        ),
        20.verticalSpace,

        // ── Passengers ──────────────────────────────────────────────────────
        _SectionHeader(label: 'Passengers'),
        12.verticalSpace,
        ...boardingPass.passengers.asMap().entries.map(
          (e) => _PassengerRow(
            passenger: e.value,
            isLast: e.key == boardingPass.passengers.length - 1,
          ),
        ),

        20.verticalSpace,
        SizedBox(
          height: 3.h,
          width: double.infinity,
          child: SvgPicture.asset(
            'assets/icon/dashed_3.svg',
            fit: BoxFit.contain,
          ),
        ),
        20.verticalSpace,

        // ── Single barcode ──────────────────────────────────────────────────
        _BarcodeSection(data: barcodeData),

        12.verticalSpace,
      ],
    );
  }

  String _capitalise(String s) =>
      s.isEmpty ? s : s[0].toUpperCase() + s.substring(1).toLowerCase();

  Color _statusColor(String status) {
    switch (status.toLowerCase()) {
      case 'ticketed':
        return const Color(0xFF2E7D32);
      case 'reserved':
        return const Color(0xFFE65100);
      case 'cancelled':
        return const Color(0xFFC62828);
      default:
        return Colors.black54;
    }
  }
}

// ─── Section header ───────────────────────────────────────────────────────────

class _SectionHeader extends StatelessWidget {
  final String label;
  const _SectionHeader({required this.label});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        label,
        style: TextStyle(
          fontFamily: 'InstrumentSans',
          color: PPaymobileColors.buttonColor,
          fontSize: 11.sp,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

// ─── Segment row ──────────────────────────────────────────────────────────────

class _SegmentRow extends StatelessWidget {
  final BookingSegmentEntity segment;
  final int index;
  final int total;
  const _SegmentRow({
    required this.segment,
    required this.index,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              height: 36.w,
              width: 36.w,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.r),
                color: PPaymobileColors.deepBackgroundColor,
              ),
              child: AppImage(
                imageUrl: segment.airlineLogo,
                width: 36.w,
                height: 36.w,
                fit: BoxFit.contain,
              ),
            ),
            10.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    segment.airline,
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    segment.flightNumber,
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.anotherGreyColor,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.r),
                color: PPaymobileColors.anotherbuttonbgColor,
              ),
              child: Text(
                segment.cabinClass,
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: PPaymobileColors.buttonColorandText,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        10.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  segment.origin,
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  FlightFormatUtils.formatTime(segment.departureTime),
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: PPaymobileColors.anotherGreyColor,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  FlightFormatUtils.formatDate(segment.departureTime),
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: PPaymobileColors.anotherGreyColor,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  FlightFormatUtils.formatDuration(segment.duration),
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: PPaymobileColors.anotherGreyColor,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                4.verticalSpace,
                SizedBox(
                  height: 16.h,
                  width: 16.h,
                  child: SvgPicture.asset(
                    'assets/icon/airplane_1.svg',
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  segment.destination,
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  FlightFormatUtils.formatTime(segment.arrivalTime),
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: PPaymobileColors.anotherGreyColor,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  FlightFormatUtils.formatDate(segment.arrivalTime),
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: PPaymobileColors.anotherGreyColor,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
        if (segment.baggage.isNotEmpty) ...[
          8.verticalSpace,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.luggage_rounded,
                size: 13.sp,
                color: PPaymobileColors.buttonColor,
              ),
              4.horizontalSpace,
              Expanded(
                child: Text(
                  segment.baggage,
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: PPaymobileColors.svgIconColor,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
        if (index < total - 1) ...[
          12.verticalSpace,
          Divider(height: 1.h, color: PPaymobileColors.deepBackgroundColor),
          12.verticalSpace,
        ],
      ],
    );
  }
}

// ─── Passenger row ────────────────────────────────────────────────────────────

class _PassengerRow extends StatelessWidget {
  final PassengerEntity passenger;
  final bool isLast;
  const _PassengerRow({required this.passenger, required this.isLast});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Passenger name',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: PPaymobileColors.buttonColor,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                4.verticalSpace,
                Text(
                  passenger.name,
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: Colors.black,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.r),
                color: PPaymobileColors.anotherbuttonbgColor,
              ),
              child: Text(
                _capitalise(passenger.type),
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: PPaymobileColors.buttonColorandText,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        if (_hasDetails(passenger)) ...[
          10.verticalSpace,
          Wrap(
            spacing: 20.w,
            runSpacing: 8.h,
            children: [
              if (passenger.gender != null && passenger.gender!.isNotEmpty)
                _MiniDetail(
                  label: 'Gender',
                  value: _capitalise(passenger.gender!),
                ),
              if (passenger.nationality != null &&
                  passenger.nationality!.isNotEmpty)
                _MiniDetail(
                  label: 'Nationality',
                  value: passenger.nationality!.toUpperCase(),
                ),
              if (passenger.dateOfBirth != null &&
                  passenger.dateOfBirth!.isNotEmpty)
                _MiniDetail(
                  label: 'Date of Birth',
                  value: FlightFormatUtils.formatDate(passenger.dateOfBirth!),
                ),
              if (passenger.passportNumber != null &&
                  passenger.passportNumber!.isNotEmpty)
                _MiniDetail(
                  label: 'Passport',
                  value: passenger.passportNumber!,
                ),
            ],
          ),
        ],
        if (!isLast) ...[
          12.verticalSpace,
          Divider(height: 1.h, color: PPaymobileColors.deepBackgroundColor),
          12.verticalSpace,
        ],
      ],
    );
  }

  bool _hasDetails(PassengerEntity p) =>
      (p.gender != null && p.gender!.isNotEmpty) ||
      (p.nationality != null && p.nationality!.isNotEmpty) ||
      (p.dateOfBirth != null && p.dateOfBirth!.isNotEmpty) ||
      (p.passportNumber != null && p.passportNumber!.isNotEmpty);

  String _capitalise(String s) =>
      s.isEmpty ? s : s[0].toUpperCase() + s.substring(1).toLowerCase();
}

class _MiniDetail extends StatelessWidget {
  final String label;
  final String value;
  const _MiniDetail({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: PPaymobileColors.anotherGreyColor,
            fontSize: 10.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        2.verticalSpace,
        Text(
          value,
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: Colors.black,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

// ─── Barcode section ──────────────────────────────────────────────────────────

class _BarcodeSection extends StatelessWidget {
  final String data;
  const _BarcodeSection({required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BarcodeWidget(
          barcode: Barcode.code128(),
          data: data,
          width: double.infinity,
          height: 72.h,
          drawText: false,
          color: Colors.black,
          backgroundColor: Colors.white,
        ),
        6.verticalSpace,
        Text(
          data,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: PPaymobileColors.anotherGreyColor,
            fontSize: 11.sp,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }
}

// ─── Info box ─────────────────────────────────────────────────────────────────

class _InfoBox extends StatelessWidget {
  final String icon;
  final String label;
  final String value;
  const _InfoBox({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      width: 178.w,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10).r,
        color: const Color(0xffF9F9F9),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 22.h,
            width: 22.h,
            child: SvgPicture.asset(icon, fit: BoxFit.contain),
          ),
          6.verticalSpace,
          Text(
            label,
            style: TextStyle(
              fontFamily: 'InstrumentSans',
              color: PPaymobileColors.anotherGreyColor,
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          4.verticalSpace,
          Text(
            value,
            style: TextStyle(
              fontFamily: 'InstrumentSans',
              color: Colors.black,
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

// ─── Detail item ──────────────────────────────────────────────────────────────

class _DetailItem extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;
  const _DetailItem({
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: PPaymobileColors.anotherGreyColor,
            fontSize: 11.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        2.verticalSpace,
        Text(
          value,
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: valueColor ?? Colors.black,
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
