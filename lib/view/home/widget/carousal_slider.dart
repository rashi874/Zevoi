import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../core/api/api_baseurl.dart';
import '../../../model/home_models/carousal_model.dart';

class CarousalSliderWidget extends StatelessWidget {
  const CarousalSliderWidget({
    super.key,
    required this.carousals,
  });
  final List<CarousalModel> carousals;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: carousals.length,
      itemBuilder: (context, index, realIndex) {
        return SizedBox(
          width: double.infinity,
          child: Image(
            image: NetworkImage(
              "http://${ApiUrl.url}:5005/carousals/${carousals[index].imagePath}",
              scale: 1.0,
            ),
            fit: BoxFit.cover,
          ),
        );
      },
      options: CarouselOptions(
        viewportFraction: 1.0,
        aspectRatio: 2.6,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
        pauseAutoPlayOnTouch: true,
        autoPlay: true,
        enableInfiniteScroll: true,
      ),
    );
  }
}
