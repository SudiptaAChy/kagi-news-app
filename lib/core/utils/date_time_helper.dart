import 'package:intl/intl.dart';

String formatDateTimeToReadable(DateTime? dateTime) {
  if (dateTime == null) return "";
  DateTime localTime = dateTime.toLocal();
  return DateFormat('MM/dd/yyyy hh:mm a').format(localTime);
}
