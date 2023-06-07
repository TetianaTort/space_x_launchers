import 'package:flutter/material.dart';

class GalleryItems extends StatefulWidget {
  const GalleryItems({
    Key? key,
  }) : super(key: key);

  @override
  State<GalleryItems> createState() => _GalleryItemsState();
}

class _GalleryItemsState extends State<GalleryItems> {
  late PageController _pageController;

  List<String> images = [
    'lib/global/assets/image_49.png',
    'lib/global/assets/image_50.png',
    'lib/global/assets/image_51.png',
  ];

  int activePage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8, initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: PageView.builder(
              itemCount: images.length,
              pageSnapping: true,
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  activePage = page;
                  print(activePage);
                });
              },
              itemBuilder: (context, pagePosition) {
                bool active = pagePosition == activePage;
                return galleryItems(images, pagePosition, active);
              }),
        ),
        const SizedBox(height: 12),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: indicators(images.length, activePage))
      ],
    );
  }
}

AnimatedContainer galleryItems(images, pagePosition, active) {
  double margin = active ? 0 : 10;

  return AnimatedContainer(
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeInOutCubic,
    margin: EdgeInsets.all(margin),
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(
        Radius.circular(10),
      ),
      image: DecorationImage(
        image: AssetImage(images[pagePosition]),
        fit: BoxFit.fill,
      ),
    ),
  );
}

List<Widget> indicators(imagesLength, currentIndex) {
  return List<Widget>.generate(imagesLength, (index) {
    return Container(
      margin: const EdgeInsets.all(3),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          color: currentIndex == index ? Colors.white : Colors.transparent,
          shape: BoxShape.circle),
    );
  });
}
