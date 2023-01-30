import 'package:apniseva/screens/dashboard/models/dash_model.dart';
import 'package:apniseva/screens/profile/profile_sections/profile_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../utils/api_endpoint_strings/api_endpoint_strings.dart';

class AllServiceScreen extends StatefulWidget {
  final List<CategoryDtl>? getData;
  const AllServiceScreen({Key? key,
    this.getData = const []
  }) : super(key: key);

  @override
  State<AllServiceScreen> createState() => _AllServiceScreenState();
}

class _AllServiceScreenState extends State<AllServiceScreen> {
  @override
  Widget build(BuildContext context) {
    List<CategoryDtl>? categoryData = widget.getData;
    return Scaffold(
      appBar: const PrimaryAppBar(
        title: 'All Services',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
           Container(
             // width: double.maxFinite,
             height: MediaQuery.of(context).size.height,
             child: ListView.builder(
               itemCount: categoryData!.length,
                 itemBuilder: (BuildContext context, int index){
                 return InkWell(
                   onTap: () {
                     // categoryData.isEmpty ? const ServiceScreen() :
                     // showBottomSheet(
                     //     context: context,
                     //     builder: (context) {
                     //       return ChooseSubCategory(getSubData: categoryData[index]);
                     //     });
                   },
                   child: Container(
                       padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                       width: MediaQuery.of(context).size.width,
                       height: 75,
                       decoration: BoxDecoration(
                         color: Colors.white,
                         border: Border(
                             bottom: BorderSide(
                                 color: Colors.grey.shade200,
                                 width: 0.5
                             )
                         ),
                       ),
                       child: ListTile(
                         leading: Padding(
                           padding: const EdgeInsets.all(2.0),
                           child: Image.network('${ApiEndPoint.imageAPI}/${categoryData[index].catImg!}',
                             width: 60,
                             height: 80,
                           ),
                         ),
                         title: Text(categoryData[index].catName!,
                           style: Theme.of(context).textTheme.labelLarge,
                         ),
                       )
                   ),
                 );
                 }),
           )

          ]
        ),
      ),
    );
  }
}
