import 'package:flutter/material.dart';

import 'dash_strings.dart';

class DashServices extends StatelessWidget {
  const DashServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: GridView.builder(
          shrinkWrap: true,
          itemCount: 20,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 0.8
          ),
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 1.0,
              color: Colors.grey.shade200,
              child: Column(
                children: [
                  Image.network(DashStrings.serviceImg),
                  Text(DashStrings.serviceName,
                    style: Theme.of(context).textTheme.labelSmall,
                  )
                ],
              ),
            );
          }
      ),
    );
  }
}
