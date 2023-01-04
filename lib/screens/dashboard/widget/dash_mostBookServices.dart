import 'package:apniseva/screens/dashboard/widget/dash_strings.dart';
import 'package:flutter/material.dart';

class DashMostViewedServices extends StatelessWidget {
  const DashMostViewedServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height - (MediaQuery.of(context).padding.bottom + MediaQuery.of(context).padding.top);
    return SizedBox(
      width: width,
      height: 190,
      child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Column(
                children: [
                  Container(
                    width: 120,
                    height: 110,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(DashStrings.bannerImg))
                    ),
                  ),
                  Text(DashStrings.productName)
                ],
              ),
            );
          }
      ),
    );
  }
}
