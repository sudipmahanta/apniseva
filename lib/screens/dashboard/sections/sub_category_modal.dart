import 'package:apniseva/screens/dashboard/model/dash_model.dart';
import 'package:apniseva/utils/api_endpoint_strings/api_endpoint_strings.dart';
import 'package:flutter/material.dart';

import '../../service/screens/service_screen.dart';

class ChooseSubCategory extends StatefulWidget {
  final List<CategoryDtlSub>? getSubData;
  const ChooseSubCategory({Key? key,
  this.getSubData
  }) : super(key: key);

  @override
  State<ChooseSubCategory> createState() => _ChooseSubCategoryState();
}

class _ChooseSubCategoryState extends State<ChooseSubCategory> {
  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;

    return Container(
      height: height * 0.6,
      // alignment: Alignment.center,
      decoration:  BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
            height: height * 0.52,
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.only(left: 10),
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 0,
                    crossAxisCount: 3,
                    childAspectRatio: 0.74
                ),
                itemCount: widget.getSubData!.length,
                itemBuilder: (BuildContext context, int index){

                  List? data = widget.getSubData;

                  return InkWell(
                    onTap: () {
                      data[index].sub!.isEmpty ? const ServiceScreen() :
                      showBottomSheet(
                          context: context,
                          builder: (context) {
                            return ChooseSubCategory(getSubData: data[index].sub);
                          });
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Card(
                          elevation: 0.4,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          ),
                          child: Container(
                            height: 110,
                            width: 110,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                            ),
                            child: Image.network('${ApiEndPoint.imageAPI}/${data![index].catImg!}',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(left: 10),
                            // color: Colors.blue,
                            child: Text(data[index].catName!,
                              maxLines: 2,
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }
            )
          ),
        ],
      ),
    );
  }
}
