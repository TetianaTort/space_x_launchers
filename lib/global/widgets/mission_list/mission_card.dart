import 'package:flutter/material.dart';
import 'package:space_x_launchers/global/models/mission_model.dart';

class MissonCard extends StatelessWidget {
  const MissonCard({
    required this.mission,
    super.key,
  });
  final MissionModel mission;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromRGBO(28, 28, 28, 1),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mission.date,
                  style: const TextStyle(
                    color: Color.fromRGBO(186, 252, 84, 1),
                    fontSize: 16,
                  ),
                ),
                Text(
                  mission.time,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mission.name,
                    maxLines: 1,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    mission.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
