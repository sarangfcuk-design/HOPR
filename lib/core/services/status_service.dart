class BusinessStatusService {
  const BusinessStatusService();

  bool isOpen({
    required String openingTime,
    required String closingTime,
  }) {
    try {
      final now = DateTime.now();

      final open = _parseTime(openingTime, now);
      var close = _parseTime(closingTime, now);

      // Overnight support (e.g. 10 PM - 2 AM)
      if (close.isBefore(open)) {
        close = close.add(const Duration(days: 1));
      }

      var current = now;

      if (current.isBefore(open) && close.day != open.day) {
        current = current.add(const Duration(days: 1));
      }

      return current.isAfter(open) &&
          current.isBefore(close);
    } catch (_) {
      return false;
    }
  }

  DateTime _parseTime(
    String value,
    DateTime base,
  ) {
    final parts = value.trim().split(" ");

    final hm = parts[0].split(":");

    int hour = int.parse(hm[0]);
    final minute = int.parse(hm[1]);

    final period = parts[1].toUpperCase();

    if (period == "PM" && hour != 12) {
      hour += 12;
    }

    if (period == "AM" && hour == 12) {
      hour = 0;
    }

    return DateTime(
      base.year,
      base.month,
      base.day,
      hour,
      minute,
    );
  }
}