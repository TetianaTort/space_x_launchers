import 'package:flutter/material.dart';

import 'package:space_x_launchers/global/utils/helpers.dart';

class GalleryItems extends StatefulWidget {
  const GalleryItems({
    Key? key,
    required this.imagesData,
    required this.onChangeItemHandler,
  }) : super(key: key);

  final List imagesData;
  final Function onChangeItemHandler;

  @override
  State<GalleryItems> createState() => _GalleryItemsState();
}

class _GalleryItemsState extends State<GalleryItems> {
  late PageController _pageController;

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
              itemCount: widget.imagesData.length,
              pageSnapping: true,
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  activePage = page;
                  widget.onChangeItemHandler(activePage);
                });
              },
              itemBuilder: (context, pagePosition) {
                bool active = pagePosition == activePage;

                return galleryItems(widget.imagesData, pagePosition, active);
              }),
        ),
        const SizedBox(height: 12),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: indicators(widget.imagesData.length, activePage))
      ],
    );
  }
}

galleryItems(imageData, pagePosition, active) {
  double margin = active ? 0 : 10;

  return GestureDetector(
    onTap: () => openLink(imageData[pagePosition].wikipediaUrl),
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
      margin: EdgeInsets.all(margin),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        image: DecorationImage(
          image: NetworkImage(imageData[pagePosition].imageUrl),
          fit: BoxFit.fill,
        ),
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
