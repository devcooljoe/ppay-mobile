import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/module/notification/domain/entities/notification_entity.dart';
import 'package:ppay_mobile/module/notification/presentation/providers/notification_providers.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/empty_state.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/skeleton_loader.dart';

@RoutePage()
class NotificationPage extends HookConsumerWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();
    final searchQuery = useState('');
    final notifState = ref.watch(getMyNotificationsProvider);

    useEffect(() {
      Future.microtask(() => ref.read(getMyNotificationsProvider.notifier).call());
      return null;
    }, []);

    useEffect(() {
      void listener() => searchQuery.value = searchController.text.toLowerCase();
      searchController.addListener(listener);
      return () => searchController.removeListener(listener);
    }, []);

    final all = notifState.value ?? [];

    final filtered = useMemoized(() {
      if (searchQuery.value.isEmpty) return all;
      return all.where((n) =>
          n.title.toLowerCase().contains(searchQuery.value) ||
          n.body.toLowerCase().contains(searchQuery.value)).toList();
    }, [all, searchQuery.value]);

    final grouped = useMemoized(() => _groupByDate(filtered), [filtered]);

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: PPAppBar(
        title: 'Notification',
        onBackPressed: () => Navigator.pop(context),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: IconButton(
              onPressed: () {},
              icon: SizedBox(
                height: 24.w,
                width: 24.w,
                child: SvgPicture.asset(
                  'assets/icon/settings_black.svg',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            46.verticalSpace,
            SizedBox(
              height: 54.h,
              width: double.infinity,
              child: TextFormField(
                controller: searchController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10.h,
                    vertical: 14.w,
                  ),
                  prefixIcon: SizedBox(
                    height: 24.w,
                    width: 24.w,
                    child: SvgPicture.asset(
                      'assets/icon/bank_search.svg',
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: PPaymobileColors.textfiedBorder,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  filled: true,
                  fillColor: const Color(0xffF4F4F4),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8).r,
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            36.verticalSpace,
            Expanded(
              child: notifState.isLoading
                  ? _buildSkeleton()
                  : notifState.hasError
                      ? Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Failed to load notifications',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: PPaymobileColors.svgIconColor,
                                  fontSize: 14.sp,
                                ),
                              ),
                              16.verticalSpace,
                              TextButton(
                                onPressed: () =>
                                    ref.read(getMyNotificationsProvider.notifier).call(),
                                child: const Text('Retry'),
                              ),
                            ],
                          ),
                        )
                      : filtered.isEmpty
                          ? EmptyState(
                              imagePath: 'assets/images/no_notif.png',
                              message: 'No Notifications Yet',
                            )
                          : ListView.separated(
                              itemCount: grouped.length,
                              separatorBuilder: (_, __) => 16.verticalSpace,
                              itemBuilder: (context, groupIndex) {
                                final group = grouped[groupIndex];
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          group.label,
                                          style: TextStyle(
                                            fontFamily: 'InstrumentSans',
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Text(
                                          group.dateLabel,
                                          style: TextStyle(
                                            fontFamily: 'InstrumentSans',
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                    41.verticalSpace,
                                    ListView.separated(
                                      itemCount: group.notifications.length,
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      separatorBuilder: (_, __) => 31.verticalSpace,
                                      itemBuilder: (context, index) {
                                        final notif = group.notifications[index];
                                        return _NotificationRow(notification: notif);
                                      },
                                    ),
                                  ],
                                );
                              },
                            ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkeleton() {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (_, __) => Padding(
        padding: EdgeInsets.only(bottom: 31.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SkeletonLoader(
              width: 54.w,
              height: 54.w,
              borderRadius: BorderRadius.circular(100.r),
            ),
            12.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SkeletonLoader(width: 160.w, height: 14.h),
                  6.verticalSpace,
                  SkeletonLoader(width: double.infinity, height: 12.h),
                  4.verticalSpace,
                  SkeletonLoader(width: 80.w, height: 10.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<_NotificationGroup> _groupByDate(List<NotificationEntity> notifications) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));

    final Map<String, List<NotificationEntity>> groups = {};
    final Map<String, String> dateLabels = {};

    for (final n in notifications) {
      final d = DateTime(n.createdAt.year, n.createdAt.month, n.createdAt.day);
      String label;
      String dateLabel;
      if (d == today) {
        label = 'Today';
        dateLabel =
            '${today.day.toString().padLeft(2, '0')}/${today.month.toString().padLeft(2, '0')}/${today.year}';
      } else if (d == yesterday) {
        label = 'Yesterday';
        dateLabel =
            '${yesterday.day.toString().padLeft(2, '0')}/${yesterday.month.toString().padLeft(2, '0')}/${yesterday.year}';
      } else {
        label = _weekdayName(n.createdAt.weekday);
        dateLabel =
            '${d.day.toString().padLeft(2, '0')}/${d.month.toString().padLeft(2, '0')}/${d.year}';
      }
      groups.putIfAbsent(label, () => []).add(n);
      dateLabels[label] = dateLabel;
    }

    return groups.entries
        .map((e) => _NotificationGroup(
              label: e.key,
              dateLabel: dateLabels[e.key]!,
              notifications: e.value,
            ))
        .toList();
  }

  String _weekdayName(int weekday) {
    const days = ['', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
    return days[weekday];
  }
}

class _NotificationGroup {
  final String label;
  final String dateLabel;
  final List<NotificationEntity> notifications;
  const _NotificationGroup({
    required this.label,
    required this.dateLabel,
    required this.notifications,
  });
}

class _NotificationRow extends StatelessWidget {
  final NotificationEntity notification;
  const _NotificationRow({required this.notification});

  @override
  Widget build(BuildContext context) {
    final isRead = notification.status == 'sent';
    return SizedBox(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 54.w,
                width: 54.w,
                decoration: BoxDecoration(
                  color: PPaymobileColors.fundWallet,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/icon/wallet.svg',
                    height: 24.w,
                    width: 24.w,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              12.horizontalSpace,
              SizedBox(
                width: 295.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      notification.title,
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    2.verticalSpace,
                    Text(
                      notification.body,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    4.verticalSpace,
                    Text(
                      _timeAgo(notification.createdAt),
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: PPaymobileColors.anotherGreyColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          28.horizontalSpace,
          Container(
            height: 11.w,
            width: 11.w,
            decoration: BoxDecoration(
              color: isRead
                  ? PPaymobileColors.deepBackgroundColor
                  : PPaymobileColors.currentCardColor,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }

  String _timeAgo(DateTime date) {
    final diff = DateTime.now().difference(date);
    if (diff.inMinutes < 1) return 'Just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes} min ago';
    if (diff.inHours < 24) return '${diff.inHours} hr ago';
    if (diff.inDays < 7) return '${diff.inDays} days ago';
    return '${date.day}/${date.month}/${date.year}';
  }
}
