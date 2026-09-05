import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/module/support_ticket/domain/entities/support_ticket_entity.dart';
import 'package:ppay_mobile/module/support_ticket/presentation/providers/support_ticket_providers.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/empty_state.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/skeleton_loader.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

@RoutePage()
class TicketListPage extends HookConsumerWidget {
  const TicketListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(ticketListProvider);

    useEffect(() {
      Future.microtask(() => ref.read(ticketListProvider.notifier).load());
      return null;
    }, const []);

    Future<void> openCreate() async {
      await context.router.push(const CreateTicketRoute());
      // Refresh after returning from create in case a new ticket was added.
      ref.read(ticketListProvider.notifier).load();
    }

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: PPAppBar(
        title: 'Support Tickets',
        onBackPressed: () => Navigator.pop(context),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openCreate,
        backgroundColor: PPaymobileColors.buttonColorandText,
        child: Icon(Icons.add_rounded, color: Colors.white, size: 26.w),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          color: PPaymobileColors.buttonColorandText,
          onRefresh: () => ref.read(ticketListProvider.notifier).load(),
          child: Builder(
            builder: (context) {
              if (state.isLoading && state.tickets.isEmpty) {
                return _LoadingSkeleton();
              }
              if (state.error != null && state.tickets.isEmpty) {
                return _ErrorView(
                  message: state.error!,
                  onRetry: () => ref.read(ticketListProvider.notifier).load(),
                );
              }
              if (state.tickets.isEmpty) {
                return ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [
                    120.verticalSpace,
                    EmptyState(
                      imagePath: 'assets/images/no_notif.png',
                      message: 'No support tickets yet',
                      subtitle:
                          'Tap the + button to open a new support ticket.',
                    ),
                  ],
                );
              }
              return ListView.separated(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                itemCount: state.tickets.length,
                separatorBuilder: (_, __) => 12.verticalSpace,
                itemBuilder: (context, index) {
                  final ticket = state.tickets[index];
                  return _TicketCard(
                    ticket: ticket,
                    onTap: () => context.router.push(
                      TicketChatRoute(
                        ticketId: ticket.id,
                        subject: ticket.subject,
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class _TicketCard extends StatelessWidget {
  final SupportTicketEntity ticket;
  final VoidCallback onTap;

  const _TicketCard({required this.ticket, required this.onTap});

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
            8.verticalSpace,
            Row(
              children: [
                _CategoryChip(category: ticket.category),
                if (ticket.isUrgent) ...[
                  6.horizontalSpace,
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
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
                ],
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
            10.verticalSpace,
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

class _CategoryChip extends StatelessWidget {
  final String category;
  const _CategoryChip({required this.category});

  String get _label {
    switch (category) {
      case 'personal_shopper':
        return 'Personal Shopper';
      case 'billing':
        return 'Billing';
      case 'technical':
        return 'Technical';
      case 'general':
        return 'General';
      default:
        return category
            .split('_')
            .map((w) => w.isEmpty ? w : '${w[0].toUpperCase()}${w.substring(1)}')
            .join(' ');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
      decoration: BoxDecoration(
        color: PPaymobileColors.deepBackgroundColor,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Text(
        _label,
        style: TextStyle(
          fontFamily: 'InstrumentSans',
          color: PPaymobileColors.svgIconColor,
          fontSize: 10.sp,
          fontWeight: FontWeight.w500,
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
      itemCount: 6,
      separatorBuilder: (_, __) => 12.verticalSpace,
      itemBuilder: (_, __) => SkeletonLoader(
        width: double.infinity,
        height: 96.h,
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
