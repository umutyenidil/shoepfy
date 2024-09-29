class DateTimeUtils {
  DateTimeUtils._();

  static String getDailyMessage() {
    int hour = DateTime.now().hour;
    if (hour >= 6 && hour < 12) {
      return "Good Morning";
    } else if (hour >= 12 && hour < 18) {
      return "Good Afternoon";
    } else if (hour >= 18 && hour < 21) {
      return "Good Evening";
    } else {
      return "Good Night";
    }
  }

  static DateTime getYesterday() {
    return DateTime.now().subtract(const Duration(days: 1));
  }

  static DateTime getNow() {
    return DateTime.now();
  }

  static DateTime getTomorrow() {
    return DateTime.now().add(const Duration(days: 1));
  }

  static DateTime getStartOfToday() {
    return DateTimeUtils.getStartOfDay(DateTimeUtils.getNow());
  }

  static DateTime getEndOfToday() {
    return DateTimeUtils.getEndOfDay(DateTimeUtils.getNow());
  }

  static List<DateTime> getLastNDays(
    int n, {
    bool includesToday = false,
  }) {
    List<DateTime> lastNDays = [];

    int initialI = 1;

    if (includesToday) {
      initialI = 0;
      n -= 1;
    }

    for (int i = initialI; i <= n; i++) {
      lastNDays.add(DateTimeUtils.getStartOfDay(getNow().subtract(Duration(days: i))));
    }

    return lastNDays;
  }

  static List<DateTime> getSortedDates(List<DateTime> dates) {
    List<DateTime> sortedDates =
        List.from(dates); // Create a copy of the original list to avoid modifying the original list
    sortedDates.sort((a, b) => a.compareTo(b));
    return sortedDates;
  }

  static bool isToday(DateTime date) {
    final DateTime today = DateTime.now();
    return date.day == today.day && date.month == today.month && date.year == today.year;
  }

  static bool areSameDay(DateTime a, DateTime b) {
    return (a.day == b.day && a.month == b.month && a.year == b.year);
  }

  static DateTime getStartOfDay(DateTime day) {
    return day.copyWith(hour: 0, minute: 0, second: 0, millisecond: 0, microsecond: 0);
  }

  static DateTime getEndOfDay(DateTime day) {
    return getStartOfDay(day).add(const Duration(days: 1)).subtract(const Duration(microseconds: 1));
  }

  List<DateTime> getCurrentWeekDays() {
    DateTime now = DateTime.now();
    DateTime firstDay = now.copyWith(day: (now.day - DateTime.monday - 1));
    firstDay = getStartOfDay(firstDay);

    List<DateTime> weekDays = List.generate(7, (index) {
      DateTime weekDay = firstDay.copyWith(day: (firstDay.day + index));
      return weekDay;
    }).toList();

    return weekDays;
  }

  static List<DateTime> getWeekDays({required DateTime anyDayInThisWeek}) {
    DateTime firstDay = anyDayInThisWeek.copyWith(day: (anyDayInThisWeek.day - DateTime.monday - 1));
    firstDay = getStartOfDay(firstDay);

    List<DateTime> weekDays = List.generate(7, (index) {
      DateTime weekDay = firstDay.copyWith(day: (firstDay.day + index));
      return weekDay;
    }).toList();

    return weekDays;
  }
}
