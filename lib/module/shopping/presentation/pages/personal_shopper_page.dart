import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/module/support_ticket/domain/entities/support_ticket_entity.dart';
import 'package:ppay_mobile/module/support_ticket/presentation/providers/support_ticket_providers.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/empty_state.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';
import 'package:ppay_mobile/shared/widgets/skeleton_loader.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

@RoutePage()
class PersonalShopperPage extends HookConsumerWidget {
  const PersonalShopperPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(ticketListProvider);

    useEffect(() {
      Future.microtask(() => ref.read(ticketListProvider.notifier).load());
      return null;
    }, const []);

    final requests =
        state.tickets.where((t) => t.category == 'personal_shopper').toList();

    Future<void> openNewRequest() async {
      await context.router.push(const PersonalShopperNewRequestRoute());
      ref.read(ticketListProvider.notifier).load();
    }

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: AppBar(
        backgroundColor: PPaymobileColors.mainScreenBackground,
        elevation: 0,
        toolbarHeight: 56,
        leadingWidth: 56.w,
        title: Text(
          'Personal Shopper',
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: Colors.black,
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
                'assets/icon/arrow_back.svg',
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: RefreshIndicator(
                color: PPaymobileColors.buttonColorandText,
                onRefresh: () => ref.read(ticketListProvider.notifier).load(),
                child: Builder(
                  builder: (context) {
                    if (state.isLoading && requests.isEmpty) {
                      return _LoadingSkeleton();
                    }
                    if (state.error != null && requests.isEmpty) {
                      return _ErrorView(
                        message: state.error!,
                        onRetry:
                            () => ref.read(ticketListProvider.notifier).load(),
                      );
                    }
                    if (requests.isEmpty) {
                      return ListView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        children: [
                          120.verticalSpace,
                          EmptyState(
                            imagePath: 'assets/images/shooping-bag.png',
                            message: 'No personal shopper requests yet',
                            subtitle:
                                'Start a new request and our team will source it for you.',
                          ),
                        ],
                      );
                    }
                    return ListView.separated(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 20.h,
                      ),
                      itemCount: requests.length,
                      separatorBuilder: (_, __) => 12.verticalSpace,
                      itemBuilder: (context, index) {
                        final ticket = requests[index];
                        return _RequestCard(
                          ticket: ticket,
                          onTap:
                              () => context.router.push(
                                PersonalShopperChatRoute(ticketId: ticket.id),
                              ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 20.h),
              child: PPButton(
                text: 'New Request',
                backgroundColor: PPaymobileColors.buttonColorandText,
                onPressed: openNewRequest,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RequestCard extends StatelessWidget {
  final SupportTicketEntity ticket;
  final VoidCallback onTap;

  const _RequestCard({required this.ticket, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TouchOpacity(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: PPaymobileColors.textfiedBorder),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 36.w,
                  width: 36.w,
                  decoration: BoxDecoration(
                    color: PPaymobileColors.buttonColorandText.withValues(
                      alpha: 0.1,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.shopping_bag_outlined,
                    size: 18.w,
                    color: PPaymobileColors.buttonColorandText,
                  ),
                ),
                10.horizontalSpace,
                Expanded(
                  child: Text(
                    ticket.subject,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                8.horizontalSpace,
                _StatusBadge(status: ticket.status),
              ],
            ),
            10.verticalSpace,
            Row(
              children: [
                if (ticket.isUrgent)
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 3.h,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF3CD),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Text(
                      'Urgent',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: const Color(0xFFE67E22),
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                const Spacer(),
                if (ticket.unreadUserCount > 0)
                  Container(
                    constraints: BoxConstraints(minWidth: 20.w),
                    height: 20.w,
                    padding: EdgeInsets.symmetric(horizontal: 6.w),
                    decoration: BoxDecoration(
                      color: PPaymobileColors.buttonColor,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Center(
                      child: Text(
                        '${ticket.unreadUserCount}',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors.white,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            8.verticalSpace,
            Text(
              DateFormat('dd MMM yyyy, hh:mm a').format(ticket.createdAt),
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: PPaymobileColors.anotherGreyColor,
                fontSize: 11.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final String status;
  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    Color color;
    String label;
    switch (status) {
      case 'resolved':
        color = PPaymobileColors.buttonColor;
        label = 'Resolved';
        break;
      case 'closed':
        color = PPaymobileColors.svgIconColor;
        label = 'Closed';
        break;
      case 'in_progress':
        color = const Color(0xFFE67E22);
        label = 'In Progress';
        break;
      default:
        color = const Color(0xFF2980B9);
        label = 'Open';
    }
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontFamily: 'InstrumentSans',
          color: color,
          fontSize: 11.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _LoadingSkeleton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      itemCount: 5,
      separatorBuilder: (_, __) => 12.verticalSpace,
      itemBuilder:
          (_, __) => SkeletonLoader(
            width: double.infinity,
            height: 104.h,
            borderRadius: BorderRadius.circular(12.r),
          ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  const _ErrorView({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        120.verticalSpace,
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: PPaymobileColors.svgIconColor,
                  fontSize: 14.sp,
                ),
              ),
              12.verticalSpace,
              TextButton(onPressed: onRetry, child: const Text('Retry')),
            ],
          ),
        ),
      ],
    );
  }
}
