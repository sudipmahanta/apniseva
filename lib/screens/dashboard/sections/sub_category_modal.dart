import 'package:apniseva/screens/service/screens/service_screen.dart';
import 'package:flutter/material.dart';

import '../widget/dash_strings.dart';

class ChooseSubCategory extends StatefulWidget {
  const ChooseSubCategory({Key? key}) : super(key: key);

  @override
  State<ChooseSubCategory> createState() => _ChooseSubCategoryState();
}

class _ChooseSubCategoryState extends State<ChooseSubCategory> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ServiceScreen()));
      },
      child: Container(
        height: 190,
        alignment: Alignment.center,
        decoration:  BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Text('Choose Category',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
            ),
            const Divider(),

            Container(
              height: 130,
              padding: const EdgeInsets.only(left: 10),
              child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Card(
                          elevation: 0.4,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          ),
                          child: Container(
                            height: 90,
                            width: 110,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(DashStrings.serviceImg))
                            ),
                          ),
                        ),
                        Text('Sub-cat',
                          style: Theme.of(context).textTheme.labelMedium,
                        )
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
