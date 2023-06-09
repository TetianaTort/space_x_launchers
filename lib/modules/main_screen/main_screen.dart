import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:space_x_launchers/global/widgets/gallery_items.dart';
import 'package:space_x_launchers/providers/missions_provider.dart';
import 'package:space_x_launchers/providers/rockets_provider.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  bool _isLoading = true;
  bool _isLoadingInfo = true;

  var activePageIndex = 0;

  getInfoData(activePageIndex) async {
    await ref
        .read(missionsProvider.notifier)
        .fetchInfoBlockData(activePageIndex, ref.read(rocketsProvider));
    setState(() {
      _isLoadingInfo = false;
    });
  }

  getGalleryData() async {
    await ref.read(rocketsProvider.notifier).fetchRocketsData();
  }

  @override
  void initState() {
    super.initState();
    getGalleryData()
        .then((value) => getInfoData(activePageIndex))
        .then((value) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final galleryItems = _isLoading ? [] : ref.read(rocketsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('SpaceX Launchers'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                galleryItems.isNotEmpty
                    ? GalleryItems(
                        imagesData: galleryItems,
                        onChangeItemHandler: getInfoData,
                      )
                    : const Center(
                        child: Text("Try again later",
                            style:
                                TextStyle(color: Colors.white, fontSize: 24)),
                      ),
                _isLoadingInfo
                    ? const Center(child: CircularProgressIndicator())
                    : Text(
                        ref.read(missionsProvider).isNotEmpty
                            ? ref.read(missionsProvider)[0].name
                            : '',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 24),
                      ),
                // )
              ],
            ),
    );
  }
}
