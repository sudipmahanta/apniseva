import 'package:apniseva/utils/api_endpoint_strings/api_endpoint_strings.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../models/dash_model.dart';
import '../widget/dash_strings.dart';

class DashCarousel extends StatelessWidget {
  final List<BannerDtl>? getData;
  const DashCarousel({Key? key,
  this.getData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height-(MediaQuery.of(context).padding.top + MediaQuery.of(context).padding.bottom);

    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: getData!.isEmpty ? Container(
          width: width * 0.75,
          height: 80,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Text(DashCarouselStrings.noData,
            style: Theme.of(context).textTheme.labelMedium,
          )
      ) : CarouselSlider.builder(
          itemCount: getData!.length,
          options: CarouselOptions(
            aspectRatio: 19/7
          ),
          itemBuilder: (context, int index, int pageIndexView) {
            List<BannerDtl>? data = getData;
        return Container(
          width: width,
          margin: const EdgeInsets.symmetric(horizontal: 1),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              fit: BoxFit.cover,
                image: NetworkImage('${ApiEndPoint.imageAPI}/${data![index].image}')
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 3.5, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Text(data[index].bannerTitle!,
                  style: Theme.of(context).textTheme.bodySmall
                ),
              )
            ],
          ),
        );},

      ),
    );
  }
}
