import 'package:ppay_mobile/module/bills/domain/entities/bill_entity.dart';
import 'package:ppay_mobile/module/bills/domain/entities/bill_type.dart';

class BillItemGroup {
  final String label;
  final List<BillItemEntity> items;

  const BillItemGroup({required this.label, required this.items});
}

class BillItemGrouper {
  static List<BillItemGroup> group(
    List<BillItemEntity> items,
    BillType billType,
  ) {
    final active = items.where((i) => i.isActive).toList();
    if (active.isEmpty) return [];

    switch (billType) {
      case BillType.data:
        return _groupByDuration(active);
      case BillType.tv:
        return _groupTv(active);
      case BillType.airtime:
      case BillType.electricity:
      case BillType.betting:
        return [BillItemGroup(label: 'All', items: active)];
    }
  }

  // Groups by duration keywords in name: Daily, Weekly, Monthly, others
  static List<BillItemGroup> _groupByDuration(List<BillItemEntity> items) {
    final daily = <BillItemEntity>[];
    final weekly = <BillItemEntity>[];
    final monthly = <BillItemEntity>[];
    final others = <BillItemEntity>[];

    for (final item in items) {
      final n = item.name.toUpperCase();
      if (n.contains('DAY') || n.contains('DAILY') || n.contains('24 HOUR')) {
        daily.add(item);
      } else if (n.contains('WEEK') || n.contains('7 DAY') || n.contains('WEEKLY')) {
        weekly.add(item);
      } else if (n.contains('MONTH') || n.contains('30 DAY') || n.contains('MONTHLY')) {
        monthly.add(item);
      } else {
        others.add(item);
      }
    }

    final groups = <BillItemGroup>[];
    if (daily.isNotEmpty) groups.add(BillItemGroup(label: 'Daily', items: daily));
    if (weekly.isNotEmpty) groups.add(BillItemGroup(label: 'Weekly', items: weekly));
    if (monthly.isNotEmpty) groups.add(BillItemGroup(label: 'Monthly', items: monthly));
    if (others.isNotEmpty) groups.add(BillItemGroup(label: 'Others', items: others));

    // Fallback: if everything landed in "others" (no duration keywords found), show all flat
    if (groups.length == 1 && groups.first.label == 'Others') {
      return [BillItemGroup(label: 'All', items: items)];
    }
    return groups;
  }

  // TV: try duration grouping first, fall back to tier grouping
  static List<BillItemGroup> _groupTv(List<BillItemEntity> items) {
    final durationGroups = _groupByDuration(items);

    // If we got meaningful duration grouping (more than just All/Others), use it
    final hasMeaningfulDuration = durationGroups.length > 1 ||
        (durationGroups.length == 1 && durationGroups.first.label != 'Others');
    if (hasMeaningfulDuration && durationGroups.first.label != 'All') {
      return durationGroups;
    }

    // Fall back to tier grouping by detecting common tier names in item names
    return _groupByTier(items);
  }

  // Groups by bouquet tier for DSTV-style providers
  static List<BillItemGroup> _groupByTier(List<BillItemEntity> items) {
    final tierKeywords = [
      'PREMIUM', 'COMPACT PLUS', 'COMPACT', 'CONFAM',
      'YANGA', 'PADI', 'FRENCH', 'ASIAN',
      'SUPER', 'CLASSIC', 'SMART', 'UNIQUE', 'BASIC', 'NOVA',
      'PRO', 'MOBILE', 'STANDARD',
    ];

    final Map<String, List<BillItemEntity>> tierMap = {};
    final ungrouped = <BillItemEntity>[];

    for (final item in items) {
      final n = item.name.toUpperCase();
      String? matched;
      // Use the first matching tier keyword (order matters — more specific first)
      for (final tier in tierKeywords) {
        if (n.contains(tier)) {
          matched = _toTitleCase(tier);
          break;
        }
      }
      if (matched != null) {
        tierMap.putIfAbsent(matched, () => []).add(item);
      } else {
        ungrouped.add(item);
      }
    }

    if (tierMap.isEmpty) {
      return [BillItemGroup(label: 'All', items: items)];
    }

    // Sort tiers by first occurrence in items list for stable ordering
    final orderedTiers = tierKeywords
        .map((t) => _toTitleCase(t))
        .where((t) => tierMap.containsKey(t))
        .toList();

    final groups = orderedTiers
        .map((t) => BillItemGroup(label: t, items: tierMap[t]!))
        .toList();

    if (ungrouped.isNotEmpty) {
      groups.add(BillItemGroup(label: 'Others', items: ungrouped));
    }

    return groups;
  }

  static String _toTitleCase(String s) {
    return s
        .split(' ')
        .map((w) => w.isEmpty
            ? ''
            : '${w[0].toUpperCase()}${w.substring(1).toLowerCase()}')
        .join(' ');
  }
}
