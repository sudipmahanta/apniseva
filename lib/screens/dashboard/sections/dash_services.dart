import 'package:apniseva/screens/dashboard/models/dash_model.dart';
import 'package:apniseva/screens/dashboard/sections/sub_category_modal.dart';
import 'package:apniseva/utils/api_endpoint_strings/api_endpoint_strings.dart';
import 'package:apniseva/utils/api_strings/api_strings.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class DashCategory extends StatefulWidget {
  final List<CategoryDtl>? getData;
  const DashCategory({Key? key,
    this.getData = const [],
  }) : super(key: key);

  @override
  State<DashCategory> createState() => _DashCategoryState();
}

class _DashCategoryState extends State<DashCategory> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 80),
        child: GridView.builder(
            shrinkWrap: true,
            itemCount: widget.getData!.length < 6 ? widget.getData!.length : 6,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.8
            ),

            itemBuilder: (BuildContext context, int index) {
              List<CategoryDtl>? data = widget.getData;
              return GestureDetector(
                onTap: () async{
                  SharedPreferences preferences = await SharedPreferences.getInstance();
                  preferences.setString(ApiStrings.catID, data[index].catId!);
                  // debugPrint("Category: ${data[index].catName}");

                  showBottomSheet(
                      context: context,
                      builder: (context) {
                        return const ChooseSubCategory();
                      });
                },
                child: Card(
                  elevation: 1.0,
                  child: Column(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            height: 90,
                            width: 90,
                            padding: const EdgeInsets.all(20),
                            child: Image.network('${ApiEndPoint.imageAPI}/${data![index].catImg!}',
                              fit: BoxFit.contain,
                            ),
                          )
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(5.0),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            )
                          ),
                          child: Text(
                            // DashStrings.serviceName
                            data[index].catName!,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ),
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
