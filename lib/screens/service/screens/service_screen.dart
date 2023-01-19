import 'package:apniseva/screens/service/sections/service_appbar.dart';
import 'package:apniseva/screens/service/sections/service_strings.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

import '../../../utils/color.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({Key? key}) : super(key: key);

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {

  bool add = false;

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: ServiceAppBar(title: ServiceStrings.serviceName),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            children: List.generate(4, (index) =>
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Card(
                    color: Colors.grey.shade50,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: width,
                            height: height * 0.25,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8)),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(ServiceStrings.serviceImg)
                                )
                            ),
                          ),

                          ListTile(
                            title: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: ServiceStrings.serviceType,
                                      style: Theme.of(context).textTheme.bodyMedium
                                    ),
                                    TextSpan(
                                      text: ServiceStrings.servicePrice,
                                      style: Theme.of(context).textTheme.labelLarge
                                    )
                                  ]
                                )
                            ),
                            subtitle: Text(ServiceStrings.serviceDesc,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            trailing: ElevatedButton(
                              
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                fixedSize: Size(width * 0.25, 37),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)
                                )
                              ),
                                onPressed: (){
                                  setState(() {
                                    add =! add;
                                  });
                                },
                                child:  Text(add== false ? 'ADDED' : 'ADD'),
                            )
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            )
          ),
        ),
      ),
    );
  }
}
