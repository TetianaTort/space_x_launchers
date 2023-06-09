class MissionModel {
  final String name;
  final String date;
  final String description;

  MissionModel({
    required this.name,
    required this.date,
    required this.description,
  });

  factory MissionModel.fromJson(Map<String, dynamic> json) {
    return MissionModel(
      name: json['mission_name'] as String,
      date: json['launch_date_utc'] as String,
      description: json['launch_site']['site_name_long'] as String,
    );
  }
}
