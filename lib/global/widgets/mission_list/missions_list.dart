import 'package:flutter/material.dart';
import 'package:space_x_launchers/global/models/mission_model.dart';
import 'package:space_x_launchers/global/widgets/mission_list/mission_card.dart';

class MissionsList extends StatelessWidget {
  const MissionsList({required this.missionsList, super.key});
  final List<MissionModel> missionsList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
            itemCount: missionsList.length,
            itemBuilder: (BuildContext context, int index) {
              return MissonCard(
                mission: missionsList[index],
              );
            }),
      ),
    );
  }
}
