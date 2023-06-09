import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:space_x_launchers/global/models/mission_model.dart';
import 'package:space_x_launchers/global/widgets/gallery_items.dart';
import 'package:space_x_launchers/global/widgets/mission_list/missions_list.dart';
import 'package:space_x_launchers/providers/missions_provider.dart';
import 'package:space_x_launchers/providers/rockets_provider.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  bool _isLoading = true;
  bool _isLoadingMissions = true;

  var activePageIndex = 0;

  getMissionsData(activePageIndex) async {
    await ref
        .read(missionsProvider.notifier)
        .fetchInfoBlockData(activePageIndex, ref.read(rocketsProvider));
    setState(() {
      _isLoadingMissions = false;
    });
  }

  getGalleryData() async {
    await ref.read(rocketsProvider.notifier).fetchRocketsData();
  }

  @override
  void initState() {
    super.initState();
    getGalleryData()
        .then((value) => getMissionsData(activePageIndex))
        .then((value) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final galleryItems = _isLoading ? [] : ref.read(rocketsProvider);
    final List<MissionModel> missionsList =
        _isLoadingMissions ? [] : ref.read(missionsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('SpaceX Launchers'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                galleryItems.isNotEmpty
                    ? GalleryItems(
                        imagesData: galleryItems,
                        onChangeItemHandler: getMissionsData,
                      )
                    : Center(
                        child: Text(
                          "Try again later",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 24, bottom: 2, left: 16, right: 16),
                  child: Text(
                    missionsList.isNotEmpty ? 'Missions' : 'No missons yet',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                _isLoadingMissions
                    ? const Center(child: CircularProgressIndicator())
                    : MissionsList(
                        missionsList: missionsList,
                      )
              ],
            ),
    );
  }
}
