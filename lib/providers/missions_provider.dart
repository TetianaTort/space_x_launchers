import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:space_x_launchers/global/endpoints/api.dart';
import 'package:space_x_launchers/global/models/mission_model.dart';

class MissionsNotifier extends StateNotifier<List<dynamic>> {
  MissionsNotifier() : super([]);

  Api api = Api();

  Future fetchInfoBlockData(activePageIndex, galleryData) async {
    if (galleryData.isNotEmpty) {
      try {
        var missionId = galleryData[activePageIndex].id;
        var response = await api.getMissions(missionId);
        List<MissionModel> missionData = [];
        response.forEach(
          (mission) => missionData.add(MissionModel.fromJson(mission)),
        );
        state = missionData;
        return missionData;
      } catch (e) {
        return [];
      }
    }
  }
}

final missionsProvider =
    StateNotifierProvider<MissionsNotifier, List<dynamic>>((ref) {
  return MissionsNotifier();
});
