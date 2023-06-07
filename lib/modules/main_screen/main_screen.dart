import 'package:flutter/material.dart';
import 'package:space_x_launchers/global/widgets/gallery_items.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SpaceX Launchers'),
      ),
      body: const GalleryItems(),
    );
  }
}
