import 'package:intl/intl.dart';

String dateToJson(DateTime date) {
  return DateFormat('yyyy-MM-dd').format(date);
}

DateTime dateFromJson(dynamic json) {
  if (json is String) {
    return DateTime.parse(json);
  } else if (json is DateTime) {
    return json;
  }
  return DateTime.now();
}

String? nullableDateToJson(DateTime? date) {
  if (date == null) return null;
  return DateFormat('yyyy-MM-dd').format(date);
}

DateTime? nullableDateFromJson(dynamic json) {
  if (json == null) return null;
  if (json is String) return DateTime.parse(json);
  if (json is DateTime) return json;
  return null;
}
