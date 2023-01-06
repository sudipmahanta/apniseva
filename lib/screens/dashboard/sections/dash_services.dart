import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

import '../widget/dash_strings.dart';

class DashServices extends StatelessWidget {
  const DashServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 220),
        child: GridView.builder(
            shrinkWrap: true,
            itemCount: 6,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.8
            ),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 210,
                          color: Colors.green,
                          alignment: Alignment.center,
                          child: ListView.builder(
                              itemCount: 10,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index){
                                return Container(
                                  // color: Colors.green,
                                  // padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8)
                                        ),
                                        child: Container(
                                          height: 90,
                                          width: 110,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(image: NetworkImage(DashStrings.serviceImg))
                                          ),
                                        ),
                                      ),
                                      Text('Sub-cat',
                                        style: Theme.of(context).textTheme.labelMedium,
                                      )
                                    ],
                                  ),
                                );
                              }),
                        );
                      });
                },
                child: Card(
                  elevation: 1.0,
                  color: Colors.grey.shade200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(DashStrings.serviceImg)),
                      Text(DashStrings.serviceName,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ],
                  ),
                ),
              );
            }
        ),
      ),
    );
  }
}
