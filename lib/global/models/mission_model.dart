import 'package:intl/intl.dart';

class MissionModel {
  final String name;
  final String dateTime;
  final String description;

  MissionModel({
    required this.name,
    required this.dateTime,
    required this.description,
  });

  factory MissionModel.fromJson(Map<String, dynamic> json) {
    return MissionModel(
      name: json['mission_name'] as String,
      dateTime: json['launch_date_utc'] as String,
      description: json['launch_site']['site_name_long'] as String,
    );
  }

  String get date => DateFormat('dd/MM/yyy').format(DateTime.parse(dateTime));

  String get time => DateFormat('hh:mm a').format(DateTime.parse(dateTime));

  getDate() {
    return DateFormat('dd/MM/yyy').format(DateTime.parse(dateTime));
  }

  getTime() {
    return DateFormat('hh:mm a').format(DateTime.parse(dateTime));
  }
}
