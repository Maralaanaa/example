import 'package:intl/intl.dart';

extension DateX on DateTime {
  String get dateFormat => DateFormat('MM/dd/yyyy').format(this);
}
