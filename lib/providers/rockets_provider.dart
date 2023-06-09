import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:space_x_launchers/global/endpoints/api.dart';
import 'package:space_x_launchers/global/models/rocket_model.dart';

class RocketsNotifier extends StateNotifier<List<dynamic>> {
  RocketsNotifier() : super([]);

  Api api = Api();
  Future fetchRocketsData() async {
    try {
      var response = await api.getRocket();
      List<RocketModel> rocketsData = [];
      response.forEach(
        (rocket) => rocketsData.add(RocketModel.fromJson(rocket)),
      );
      state = rocketsData;
      return rocketsData;
    } catch (e) {
      return [];
    }
  }
}

final rocketsProvider =
    StateNotifierProvider<RocketsNotifier, List<dynamic>>((ref) {
  return RocketsNotifier();
});
