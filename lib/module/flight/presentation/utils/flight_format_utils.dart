import 'package:intl/intl.dart';

class FlightFormatUtils {
  static String formatDuration(int minutes) {
    final h = minutes ~/ 60;
    final m = minutes % 60;
    if (h == 0) return '${m}MIN';
    if (m == 0) return '${h}H';
    return '${h}H ${m}MIN';
  }

  static String formatTime(String isoString) {
    try {
      final dt = DateTime.parse(isoString).toLocal();
      return DateFormat('hh:mm a').format(dt);
    } catch (_) {
      return isoString;
    }
  }

  static String formatDate(String isoString) {
    try {
      final dt = DateTime.parse(isoString).toLocal();
      return DateFormat('EEE, MMM d').format(dt);
    } catch (_) {
      return isoString;
    }
  }

  static String formatAmount(double amount) {
    return NumberFormat('#,##0.00', 'en_US').format(amount);
  }

  static String stopsLabel(int stops) {
    if (stops == 0) return 'Direct';
    if (stops == 1) return '1 Stop';
    return '$stops Stops';
  }
}
