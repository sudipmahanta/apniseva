import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

import '../widget/dash_strings.dart';

class DashServices extends StatelessWidget {
  const DashServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
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
                      return Badge(
                        badgeContent: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(Remix.close_line)),
                        badgeColor: Colors.transparent,
                        elevation: 0,
                        position: const BadgePosition(
                          end: 0,
                          top: -30
                        ),
                        child: Container(
                          color: Colors.grey,
                        ),
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
    );
  }
}