import 'package:flutter/material.dart';
import 'full_screen_zoom_view.dart';

class ImageSliderWithZoom extends StatefulWidget {
  final List<String> imageUrls;

  const ImageSliderWithZoom({Key? key, required this.imageUrls}) : super(key: key);

  @override
  State<ImageSliderWithZoom> createState() => _ImageSliderWithZoomState();
}

class _ImageSliderWithZoomState extends State<ImageSliderWithZoom> {
  int currentIndex = 0;

  void openFullScreen(int initialIndex) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => FullScreenGallery(
          images: widget.imageUrls,
          initialIndex: initialIndex,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: GestureDetector(
              onTap: () => openFullScreen(currentIndex),
              child: SizedBox(
                height: 200,
                child: PageView.builder(
                  itemCount: widget.imageUrls.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Image.network(
                      widget.imageUrls[index],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    );
                  },
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                "${currentIndex + 1} / ${widget.imageUrls.length}",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
