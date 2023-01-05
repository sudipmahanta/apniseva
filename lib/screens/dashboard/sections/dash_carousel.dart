import 'package:apniseva/screens/dashboard/widget/dash_strings.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DashCarousel extends StatelessWidget {
  const DashCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height-(MediaQuery.of(context).padding.top + MediaQuery.of(context).padding.bottom);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: CarouselSlider.builder(
          itemCount: 3,
          options: CarouselOptions(
            aspectRatio: 19/7
          ),
          itemBuilder: (context, int index, int pageIndexView) {
        return Container(
          width: width,
          margin: const EdgeInsets.symmetric(horizontal: 1),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              fit: BoxFit.cover,
                image: NetworkImage(DashStrings.bannerImg)
            ),
          ),
        );
        },

      ),
    );
  }
}
