import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';

import '../../../core/api/api_baseurl.dart';

class ImageCarousalsWidget extends StatelessWidget {
  const ImageCarousalsWidget({
    super.key,
    required this.images,
  });
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: images.length,
      itemBuilder: (context, index, realIndex) {
        log(images[index].toString());
        return Image(
          image: NetworkImage(
              "http://${ApiUrl.url}:5005/products/${images[index]}"),
          fit: BoxFit.contain,
        );
      },
      options: CarouselOptions(
        aspectRatio: 1.3,
        viewportFraction: 2.0,
        enableInfiniteScroll: true,
      ),
    );
  }
}
