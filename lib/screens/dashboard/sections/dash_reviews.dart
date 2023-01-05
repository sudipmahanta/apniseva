import 'package:apniseva/screens/dashboard/widget/dash_strings.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class DashReviews extends StatelessWidget {
  const DashReviews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height - (MediaQuery.of(context).padding.bottom + MediaQuery.of(context).padding.top);
    return SizedBox(
      width: width,
      height: 170,
      child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            var data = cardColor[index];
            return Container(
              width: 120,
              height: 70,
              margin: const EdgeInsets.only(right: 10.0),
              decoration: BoxDecoration(
                color: data.colors,
                borderRadius: BorderRadius.circular(8)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Icon(Remix.double_quotes_l),
                    ),
                    Text('Best Services',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Text('The way ApniSeva assisted us in completing',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundImage: NetworkImage(DashStrings.bannerImg),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('JhonAdam',
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                            Text('JhonAdam',
                              style: Theme.of(context).textTheme.titleSmall,
                            )
                          ],
                        )

                      ],
                    )
                  ],
                ),
              )
            );
          }
      ),
    );
  }
}

List<ReviewCardColors> cardColor = [
  ReviewCardColors(colors: const Color(0xFFD0EF72)),
  ReviewCardColors(colors: const Color(0xFFEBE5FF)),
  ReviewCardColors(colors: const Color(0xFFDAB5DA)),
  ReviewCardColors(colors: const Color(0xFFFFCADE)),
  ReviewCardColors(colors: const Color(0xFFCAD3DC)),
  ReviewCardColors(colors: const Color(0xFFFFFF00)),
  ReviewCardColors(colors: const Color(0xFFF5F5E3)),
  ReviewCardColors(colors: const Color(0xFFFCE6C9)),
  ReviewCardColors(colors: const Color(0xFFFFE9E5)),
  ReviewCardColors(colors: const Color(0xFFAADD00)),
];

class ReviewCardColors {
  Color colors;
  ReviewCardColors({required this.colors});
}